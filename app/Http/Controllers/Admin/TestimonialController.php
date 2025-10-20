<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Testimonials;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use Illuminate\Validation\Rules\File;

class TestimonialController extends Controller
{
    public function index()
    {
        $testimonials = Testimonials::orderBy('sort_order', 'asc')->paginate(15);

        return view('backend.testimonials.index', compact('testimonials'));
    }

    public function create(Request $request)
    {
        return view('backend.testimonials.create');
    }

    public function store(Request $request)
    {
        $request->validate([
            'name' => 'required|string|max:255',
            'title' => 'nullable|string|max:255',
            'comment' => 'required|string',
            'sort_order' => 'nullable|integer',
            'status' => 'required|in:0,1',
            'video' => 'nullable|file|mimes:mp4,mov,avi,wmv,flv,mkv|max:51200' // 50MB max, supports common video formats
        ]);

        $data = [
            'name' => $request->name,
            'title' => $request->title,
            'comment' => $request->comment,
            'sort_order' => $request->sort_order ?? 0,
            'status' => $request->status
        ];

        // Handle image upload
        if ($request->hasFile('image')) {
            $image = $request->file('image');
            $imagePath = $image->store('testimonial_images', 'public');
            $data['image'] = $imagePath;
        }

        // Handle video upload
        if ($request->hasFile('video')) {
            $video = $request->file('video');
            $videoPath = $video->store('testimonial_videos', 'public');
            $data['video'] = $videoPath;
        }

        $testimonial = Testimonials::create($data);

        return redirect()->route('testimonials.index')->with([
            'status' => "Testimonial created successfully"
        ]);
    }

    public function edit(Testimonials $testimonial)
    {
        return view('backend.testimonials.edit', compact('testimonial'));
    }

    public function update(Request $request, Testimonials $testimonial)
    {
        $request->validate([
            'name' => 'required|string|max:255',
            'title' => 'nullable|string|max:255',
            'comment' => 'required|string',
            'sort_order' => 'nullable|integer',
            'status' => 'required|in:0,1',
            'video' => 'nullable|file|mimes:mp4,mov,avi,wmv,flv,mkv|max:51200' // 50MB max, supports common video formats
        ]);

        $data = [
            'name' => $request->name,
            'title' => $request->title,
            'comment' => $request->comment,
            'sort_order' => $request->sort_order ?? 0,
            'status' => $request->status
        ];

        // Handle image upload
        if ($request->hasFile('image')) {
            // Delete old image if exists
            if ($testimonial->image) {
                Storage::disk('public')->delete($testimonial->image);
            }
            
            $image = $request->file('image');
            $imagePath = $image->store('testimonial_images', 'public');
            $data['image'] = $imagePath;
        }

        // Handle video upload
        if ($request->hasFile('video')) {
            // Delete old video if exists
            if ($testimonial->video) {
                Storage::disk('public')->delete($testimonial->video);
            }
            
            $video = $request->file('video');
            $videoPath = $video->store('testimonial_videos', 'public');
            $data['video'] = $videoPath;
        }

        $testimonial->update($data);

        return redirect()->route('testimonials.index')->with([
            'status' => "Testimonial details Updated"
        ]);
    }

    public function destroy($id)
    {
        Testimonials::destroy($id);

        flash('Testimonial ' . trans('messages.deleted_msg'))->success();
        return redirect()->route('testimonials.index');
    }

    public function updateStatus(Request $request)
    {
        $test = Testimonials::findOrFail($request->id);

        $test->status = $request->status;
        if ($test->save()) {
            return 1;
        }
        return 0;
    }
}
