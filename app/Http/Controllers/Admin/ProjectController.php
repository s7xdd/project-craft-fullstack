<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Project;
use App\Models\ProjectTranslation;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use Intervention\Image\Facades\Image;
use Illuminate\Support\Str;

class ProjectController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
        $this->middleware('permission:manage_projects', ['only' => ['index', 'create', 'store', 'edit', 'update', 'destroy']]);
    }

    public function index(Request $request)
    {
        $sort_search = null;
        $projects = Project::with('parent')->orderBy('sort_order', 'asc');

        if ($request->has('search')) {
            $sort_search = $request->search;
            $projects = $projects->where('name', 'like', '%' . $sort_search . '%');
        }

        $projects = $projects->paginate(15);

        return view('backend.projects.index', compact('projects', 'sort_search'));
    }

    public function create()
    {
        $projects = Project::whereNull('parent_id')->get();
        $all_projects = Project::whereNull('parent_id')->get();

        return view('backend.projects.create', compact('projects', 'all_projects'));
    }

    public function store(Request $request)
    {

        // return response()->json([
        //     'request' => $request->all()
        // ]);

        $request->validate([
            'name' => 'required',
            'gallery_images' => 'image|mimes:jpeg,png,jpg,gif|max:2048',
            'slug' => 'required',
        ]);

        $slug = $request->slug ? Str::slug($request->slug, '-') : Str::slug($request->name, '-');
        $slug = Str::lower($slug);
        $same_slug_count = Project::where('slug', 'LIKE', $slug . '%')->count();
        $slug_suffix = $same_slug_count ? '-' . ($same_slug_count + 1) : '';
        $slug .= $slug_suffix;

        $project = new Project;
        $project->name = $request->name ?? NULL;
        $project->subtitle = $request->subtitle;
        $project->slug = $slug;
        $project->image = $request->image;
        $project->status = $request->status;
        $project->completion_status = $request->completion_status;
        $project->sort_order = $request->sort_order;
        $project->parent_id = $request->parent_id ?? null;

        $highlights = [];
        for ($i = 1; $i <= 3; $i++) {
            $highlights[] = [
                'title' => $request->input('title' . $i),
                'subtitle' => $request->input('subtitle' . $i)
            ];
        }

        $project->highlights = json_encode($highlights);

        $tagsData = getTagsFromRequest($request);
        $project->tags = $tagsData['tags'];

        $gallery = [];
        if ($request->hasFile('gallery_images')) {
            $count = 1;
            foreach ($request->file('gallery_images') as $image) {
                $gallery[] = $this->downloadAndResizeImageForProject($image, $slug, false, $count++);
            }
            $project->photos = implode(',', $gallery);
        }

        $project->save();

        $project_translation = ProjectTranslation::firstOrNew(['lang' => env('DEFAULT_LANGUAGE'), 'project_id' => $project->id]);
        $project_translation->name = $request->name;
        $project_translation->description = $request->description;
        $project_translation->meta_title = $request->meta_title;
        $project_translation->meta_description = $request->meta_description;
        $project_translation->meta_keywords = $request->meta_keywords;
        $project_translation->og_title = $request->og_title;
        $project_translation->og_description = $request->og_description;
        $project_translation->twitter_title = $request->twitter_title;
        $project_translation->twitter_description = $request->twitter_description;
        $project_translation->save();

        flash('Project ' . trans('messages.created_msg'))->success();
        return redirect()->route('project.index');
    }

    public function edit(Request $request, $id)
    {
        $lang = $request->lang;
        $project = Project::findOrFail($id);
        $all_projects = Project::whereNull('parent_id')->where('id', '!=', $id)->get();

        return view('backend.projects.edit', compact('project', 'lang', 'all_projects'));
    }

    public function update(Request $request, $id)
    {

        $request->validate([
            'name' => 'required',
            'slug' => 'required',
        ]);

        $project = Project::findOrFail($id);

        $slug = '';
        if ($request->slug != null) {
            $slug = strtolower(Str::slug($request->slug, '-'));
            $same_slug_count = Project::where('slug', 'LIKE', $slug . '%')->where('id', '!=', $project->id)->count();
            $slug_suffix = $same_slug_count > 0 ? '-' . ($same_slug_count + 1) : '';
            $slug .= $slug_suffix;
        }

        if ($request->lang == env("DEFAULT_LANGUAGE", 'en')) {
            $project->name = $request->name;
            $project->subtitle = $request->subtitle;
            $project->status = $request->status;
            $project->completion_status = $request->completion_status;
            $project->slug = $slug;
            $project->image = $request->image;
            $project->sort_order = $request->sort_order;
            $project->parent_id = $request->parent_id ?? null;

            for ($i = 1; $i <= 3; $i++) {
                $highlights[] = [
                    'title' => $request->input('title' . $i),
                    'subtitle' => $request->input('subtitle' . $i)
                ];
            }
            $project->highlights = json_encode($highlights);

            $tagsData = getTagsFromRequest($request);
            $project->tags = $tagsData['tags'];

            $gallery = [];
            if ($request->hasFile('gallery_images')) {
                $count = 1;
                foreach ($request->file('gallery_images') as $image) {
                    $gallery[] = $this->downloadAndResizeImageForProject($image, $slug, false, $count++);
                }
                $project->photos = implode(',', $gallery);
            }

            $project->save();
        }

        $project_translation = ProjectTranslation::firstOrNew(['lang' => $request->lang, 'project_id' => $project->id]);
        $project_translation->name = $request->name;
        $project_translation->description = $request->description;
        $project_translation->meta_title = $request->meta_title;
        $project_translation->meta_description = $request->meta_description;
        $project_translation->meta_keywords = $request->meta_keywords;
        $project_translation->og_title = $request->og_title;
        $project_translation->og_description = $request->og_description;
        $project_translation->twitter_title = $request->twitter_title;
        $project_translation->twitter_description = $request->twitter_description;
        $project_translation->save();

        flash(trans('messages.project') . trans('messages.updated_msg'))->success();
        return redirect()->route('project.index');
    }

    public function destroy($id)
    {
        Project::destroy($id);
        flash(trans('messages.project') . trans('messages.deleted_msg'))->success();
        return redirect()->route('project.index');
    }

    public function updateStatus(Request $request)
    {
        $project = Project::findOrFail($request->id);
        $project->status = $request->status;
        $project->save();
        return 1;
    }

    public function downloadAndResizeImageForProject($imageFile, $projectSlug, $mainImage = false, $count = 1)
    {
        $ext = $imageFile->getClientOriginalExtension();

        $path = 'projects/' . $projectSlug . '/';
        if ($mainImage) {
            $path .= 'main/';
        }

        $filename = $mainImage
            ? $path . $projectSlug . '.' . $ext
            : $path . $projectSlug . '_gallery_' . $count . '.' . $ext;

        $imageContents = file_get_contents($imageFile);

        Storage::disk('public')->put($filename, $imageContents);
        $dataUrl = Storage::url($filename);

        $image = Image::make($imageContents);
        $sizes = config('app.img_sizes', [300, 600, 1200]);

        foreach ($sizes as $size) {
            $resizedImage = $image->resize($size, null, function ($constraint) {
                $constraint->aspectRatio();
                $constraint->upsize();
            });

            $resizedFilename = $mainImage
                ? $path . $projectSlug . "_{$size}px." . $ext
                : $path . $projectSlug . '_gallery_' . $count . "_{$size}px." . $ext;

            Storage::disk('public')->put($resizedFilename, $resizedImage->encode());
        }

        return $dataUrl;
    }

    public function delete_gallery(Request $request)
    {
        $imageUrl = $request->input('image_url');
        $projectId = $request->input('project_id');

        if (!$imageUrl || !$projectId) {
            return response()->json(['error' => 'Image URL and Project ID are required'], 400);
        }

        $project = Project::find($projectId);
        if (!$project) {
            return response()->json(['error' => 'Project not found'], 404);
        }

        $storagePath = str_replace('/storage/', '', parse_url($imageUrl, PHP_URL_PATH));

        if (Storage::disk('public')->exists($storagePath)) {
            Storage::disk('public')->delete($storagePath);
        }

        $pathInfo = pathinfo($storagePath);
        $baseName = $pathInfo['filename'];
        $ext = $pathInfo['extension'];
        $dir = $pathInfo['dirname'];

        $sizes = config('app.img_sizes', [300, 600, 1200]);

        foreach ($sizes as $size) {
            $resizedFilename = $dir . '/' . $baseName . "_{$size}px." . $ext;
            if (Storage::disk('public')->exists($resizedFilename)) {
                Storage::disk('public')->delete($resizedFilename);
            }
        }

        $photos = $project->photos ? explode(',', $project->photos) : [];
        $photos = array_filter($photos, function ($photo) use ($imageUrl) {
            return trim($photo) !== trim($imageUrl);
        });

        $project->photos = implode(',', $photos);
        $project->save();

        return response()->json(['success' => true, 'message' => 'Gallery image deleted successfully']);
    }
}
