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

    public function createWithForm(Request $request)
    {
        $lang = $request->lang ?? env('DEFAULT_LANGUAGE', 'en');

        $existingData = [
            'project_id' => null,
            'lang' => $lang,
            'name' => '',
            'subtitle' => '',
            'description' => '',
            'slug' => '',
            'image' => '',
            'status' => 1,
            'completion_status' => 'ongoing',
            'sort_order' => 0,
            'parent_id' => null,
            'meta_title' => '',
            'meta_description' => '',
            'meta_keywords' => '',
            'og_title' => '',
            'og_description' => '',
            'twitter_title' => '',
            'twitter_description' => '',
            'title1' => '',
            'subtitle1' => '',
            'title2' => '',
            'subtitle2' => '',
            'title3' => '',
            'subtitle3' => '',
        ];

        $all_projects = Project::whereNull('parent_id')->get();
        $projectOptions = [];
        foreach ($all_projects as $project) {
            $projectOptions[] = ["label" => $project->name, "value" => $project->id];
        }

        $formFields = [
            "components" => [
                [
                    "type" => "panel",
                    "key" => "basic_info",
                    "label" => "Basic Information",
                    "title" => "Basic Information",
                    "input" => false,
                    "components" => [
                        [
                            "type" => "hidden",
                            "input" => true,
                            "key" => "project_id",
                            "value" => "{{ null }}",
                        ],
                        [
                            "type" => "hidden",
                            "input" => true,
                            "key" => "lang",
                            "value" => "{{ $lang }}",
                        ],
                        [
                            "type" => "textfield",
                            "input" => true,
                            "key" => "name",
                            "label" => "Project Name",
                            "validate" => [
                                "required" => true
                            ]
                        ],
                        [
                            "type" => "textfield",
                            "input" => true,
                            "key" => "subtitle",
                            "label" => "Subtitle"
                        ],
                        [
                            "type" => "textfield",
                            "input" => true,
                            "key" => "slug",
                            "label" => "Slug",
                            "validate" => [
                                "required" => true
                            ]
                        ],
                        [
                            "type" => "select",
                            "input" => true,
                            "key" => "parent_id",
                            "label" => "Parent Project",
                            "data" => [
                                "values" => $projectOptions
                            ],
                            "multiple" => false
                        ],
                        [
                            "label" => "Main Image",
                            "tableView" => false,
                            "storage" => "base64",
                            "webcam" => false,
                            "image" => true,
                            "fileTypes" => [
                                [
                                    "label" => "",
                                    "value" => ""
                                ]
                            ],
                            "validateWhenHidden" => false,
                            "key" => "image",
                            "type" => "file",
                            "input" => true
                        ],
                        [
                            "type" => "textarea",
                            "input" => true,
                            "wysiwyg" => true,
                            "key" => "description",
                            "label" => "Description"
                        ],
                        [
                            "type" => "number",
                            "input" => true,
                            "key" => "sort_order",
                            "label" => "Sort Order"
                        ],
                        [
                            "type" => "select",
                            "input" => true,
                            "key" => "status",
                            "label" => "Status",
                            "data" => [
                                "values" => [
                                    ["label" => "Active", "value" => "1"],
                                    ["label" => "Inactive", "value" => "0"]
                                ]
                            ]
                        ],
                        [
                            "type" => "select",
                            "input" => true,
                            "key" => "completion_status",
                            "label" => "Completion Status",
                            "data" => [
                                "values" => [
                                    ["label" => "Ongoing", "value" => "ongoing"],
                                    ["label" => "Completed", "value" => "completed"]
                                ]
                            ]
                        ]
                    ]
                ],

                [
                    "collapsible" => false,
                    "key" => "panel",
                    "type" => "panel",
                    "label" => "Panel",
                    "title"  => "Project Highlights",
                    "input" => false,
                    "tableView" => false,
                    "components" => [
                        [
                            "label" => "Highlight",
                            "applyMaskOn" => "change",
                            "tableView" => true,
                            "validateWhenHidden" => false,
                            "key" => "textField",
                            "type" => "textfield",
                            "input" => true
                        ],
                        [
                            "label" => "Text Field",
                            "applyMaskOn" => "change",
                            "tableView" => true,
                            "validateWhenHidden" => false,
                            "key" => "textField1",
                            "type" => "textfield",
                            "input" => true
                        ]
                    ]
                ],

                [
                    "type" => "panel",
                    "key" => "gallery",
                    "label" => "Gallery Images",
                    "input" => false,
                    "components" => [
                        [
                            "label" => "Gallery Images",
                            "tableView" => false,
                            "storage" => "base64",
                            "webcam" => false,
                            "image" => true,
                            "multiple" => true,
                            "fileTypes" => [
                                [
                                    "label" => "",
                                    "value" => ""
                                ]
                            ],
                            "validateWhenHidden" => false,
                            "key" => "gallery_images",
                            "type" => "file",
                            "input" => true
                        ]
                    ]
                ],
                [
                    "type" => "panel",
                    "key" => "seo_fields",
                    "label" => "SEO Fields",
                    "collapsible" => true,
                    "input" => false,
                    "components" => [
                        [
                            "type" => "textfield",
                            "input" => true,
                            "key" => "meta_title",
                            "label" => "Meta Title"
                        ],
                        [
                            "type" => "textarea",
                            "input" => true,
                            "key" => "meta_description",
                            "label" => "Meta Description"
                        ],
                        [
                            "type" => "textarea",
                            "input" => true,
                            "key" => "meta_keywords",
                            "label" => "Meta Keywords",
                            "description" => "Separate with comma"
                        ],
                        [
                            "type" => "textfield",
                            "input" => true,
                            "key" => "og_title",
                            "label" => "OG Title"
                        ],
                        [
                            "type" => "textarea",
                            "input" => true,
                            "key" => "og_description",
                            "label" => "OG Description"
                        ],
                        [
                            "type" => "textfield",
                            "input" => true,
                            "key" => "twitter_title",
                            "label" => "Twitter Title"
                        ],
                        [
                            "type" => "textarea",
                            "input" => true,
                            "key" => "twitter_description",
                            "label" => "Twitter Description"
                        ]
                    ]
                ],
                [
                    "type" => "button",
                    "label" => "Submit",
                    "key" => "submit",
                    "disableOnInvalid" => true,
                    "input" => true,
                    "tableView" => false,
                    "action" => "submit"
                ]
            ]
        ];

        return view('form')->with([
            'definition' => json_encode($formFields),
            'data' => json_encode($existingData),
            'title' => "Add New Project",
            'submitRoute' => route('project.store')
        ]);
    }

    public function editWithForm(Request $request, $id)
    {
        $lang = $request->lang ?? env('DEFAULT_LANGUAGE', 'en');
        $project = Project::findOrFail($id);

        $highlights = json_decode($project->highlights, true) ?? [];

        $existingData = [
            'project_id' => $project->id,
            'lang' => $lang,
            'name' => $project->getTranslation('name', $lang),
            'subtitle' => $project->subtitle,
            'description' => $project->getTranslation('description', $lang),
            'slug' => $project->slug,
            'image' => $project->image,
            'status' => $project->status,
            'completion_status' => $project->completion_status,
            'sort_order' => $project->sort_order,
            'parent_id' => $project->parent_id,
            'meta_title' => $project->getTranslation('meta_title', $lang),
            'meta_description' => $project->getTranslation('meta_description', $lang),
            'meta_keywords' => $project->getTranslation('meta_keywords', $lang),
            'og_title' => $project->getTranslation('og_title', $lang),
            'og_description' => $project->getTranslation('og_description', $lang),
            'twitter_title' => $project->getTranslation('twitter_title', $lang),
            'twitter_description' => $project->getTranslation('twitter_description', $lang),
            'highlights' => $project->highlights ? json_decode($project->highlights) : [],
        ];

        $all_projects = Project::whereNull('parent_id')->where('id', '!=', $id)->get();
        $projectOptions = [];
        foreach ($all_projects as $proj) {
            $projectOptions[] = ["label" => $proj->name, "value" => $proj->id];
        }

        $formFields = [
            "components" => [
                [
                    "type" => "panel",
                    "key" => "basic_info",
                    "label" => "Basic Information",
                    "title" => "Basic Information",
                    "input" => false,
                    "components" => [
                        [
                            "type" => "hidden",
                            "input" => true,
                            "key" => "project_id",
                            "value" => "{{ $project->id }}",
                        ],
                        [
                            "type" => "hidden",
                            "input" => true,
                            "key" => "lang",
                            "value" => "{{ $lang }}",
                        ],
                        [
                            "type" => "textfield",
                            "input" => true,
                            "key" => "name",
                            "label" => "Project Name",
                            "validate" => [
                                "required" => true
                            ]
                        ],
                        [
                            "type" => "textfield",
                            "input" => true,
                            "key" => "subtitle",
                            "label" => "Subtitle"
                        ],
                        [
                            "type" => "textfield",
                            "input" => true,
                            "key" => "slug",
                            "label" => "Slug",
                            "validate" => [
                                "required" => true
                            ]
                        ],
                        [
                            "type" => "select",
                            "input" => true,
                            "key" => "parent_id",
                            "label" => "Parent Project",
                            "data" => [
                                "values" => $projectOptions
                            ],
                            "multiple" => false
                        ],
                        [
                            "label" => "Main Image",
                            "tableView" => false,
                            "storage" => "base64",
                            "webcam" => false,
                            "image" => true,
                            "fileTypes" => [
                                [
                                    "label" => "",
                                    "value" => ""
                                ]
                            ],
                            "validateWhenHidden" => false,
                            "key" => "image",
                            "type" => "file",
                            "input" => true
                        ],
                        [
                            "type" => "textarea",
                            "input" => true,
                            "wysiwyg" => true,
                            "key" => "description",
                            "label" => "Description"
                        ],
                        [
                            "type" => "number",
                            "input" => true,
                            "key" => "sort_order",
                            "label" => "Sort Order"
                        ],
                        [
                            "type" => "select",
                            "input" => true,
                            "key" => "status",
                            "label" => "Status",
                            "data" => [
                                "values" => [
                                    ["label" => "Active", "value" => "1"],
                                    ["label" => "Inactive", "value" => "0"]
                                ]
                            ]
                        ],
                        [
                            "type" => "select",
                            "input" => true,
                            "key" => "completion_status",
                            "label" => "Completion Status",
                            "data" => [
                                "values" => [
                                    ["label" => "Ongoing", "value" => "ongoing"],
                                    ["label" => "Completed", "value" => "completed"]
                                ]
                            ]
                        ]
                    ]
                ],

                [
                    "collapsible" => false,
                    "key" => "panel",
                    "type" => "panel",
                    "label" => "Panel",
                    "title"  => "Project Highlights",
                    "input" => false,
                    "tableView" => false,
                    "components" => [
                        [
                            "label" => "Highlight",
                            "applyMaskOn" => "change",
                            "tableView" => true,
                            "validateWhenHidden" => false,
                            "key" => "textField",
                            "type" => "textfield",
                            "input" => true
                        ],
                        [
                            "label" => "Text Field",
                            "applyMaskOn" => "change",
                            "tableView" => true,
                            "validateWhenHidden" => false,
                            "key" => "textField1",
                            "type" => "textfield",
                            "input" => true
                        ]
                    ]
                ],

                [
                    "collapsible" => false,
                    "key" => "panel",
                    "type" => "panel",
                    "label" => "Panel",
                    "title"  => "Project Highlights",
                    "input" => false,
                    "tableView" => false,
                    "components" => [
                        [
                            "label" => "Data Grid",
                            "disableAddingRemovingRows" => false,
                            "reorder" => false,
                            "addAnotherPosition" => "bottom",
                            "layoutFixed" => false,
                            "enableRowGroups" => false,
                            "initEmpty" => false,
                            "tableView" => false,
                            "defaultValue" => [
                                [
                                    "textField" => "",
                                    "textField1" => ""
                                ]
                            ],
                            "validate" => [
                                "minLength" => "1"
                            ],
                            "validateOn" => "change",
                            "validateOnBlur" => false,
                            "validateOnInput" => false,
                            "validateRequired" => false,
                            "validateMultiple" => false,
                            "validateCustom" => "",
                            "validateCustomPrivate" => false,
                            "key" => "dataGrid",
                            "type" => "datagrid",
                            "input" => true,
                            "components" => [
                                [
                                    "label" => "Title",
                                    "applyMask" => false,
                                    "applyMaskOn" => "change",
                                    "autoComplete" => "off",
                                    "tableView" => true,
                                    "validate" => [],
                                    "validateOn" => "change",
                                    "validateOnBlur" => false,
                                    "validateOnInput" => false,
                                    "validateRequired" => false,
                                    "key" => "textField",
                                    "type" => "textfield",
                                    "input" => true
                                ],
                                [
                                    "label" => "Subtitle",
                                    "applyMask" => false,
                                    "applyMaskOn" => "change",
                                    "autoComplete" => "off",
                                    "tableView" => true,
                                    "validate" => [],
                                    "validateOn" => "change",
                                    "validateOnBlur" => false,
                                    "validateOnInput" => false,
                                    "validateRequired" => false,
                                    "key" => "textField1",
                                    "type" => "textfield",
                                    "input" => true
                                ]
                            ]
                        ],
                    ]
                ],

                [
                    "type" => "panel",
                    "key" => "gallery",
                    "label" => "Gallery Images",
                    "input" => false,
                    "components" => [
                        [
                            "label" => "Gallery Images",
                            "tableView" => false,
                            "storage" => "base64",
                            "webcam" => false,
                            "image" => true,
                            "multiple" => true,
                            "fileTypes" => [
                                [
                                    "label" => "",
                                    "value" => ""
                                ]
                            ],
                            "validateWhenHidden" => false,
                            "key" => "gallery_images",
                            "type" => "file",
                            "input" => true
                        ]
                    ]
                ],
                [
                    "type" => "panel",
                    "key" => "seo_fields",
                    "label" => "SEO Fields",
                    "collapsible" => true,
                    "input" => false,
                    "components" => [
                        [
                            "type" => "textfield",
                            "input" => true,
                            "key" => "meta_title",
                            "label" => "Meta Title"
                        ],
                        [
                            "type" => "textarea",
                            "input" => true,
                            "key" => "meta_description",
                            "label" => "Meta Description"
                        ],
                        [
                            "type" => "textarea",
                            "input" => true,
                            "key" => "meta_keywords",
                            "label" => "Meta Keywords",
                            "description" => "Separate with comma"
                        ],
                        [
                            "type" => "textfield",
                            "input" => true,
                            "key" => "og_title",
                            "label" => "OG Title"
                        ],
                        [
                            "type" => "textarea",
                            "input" => true,
                            "key" => "og_description",
                            "label" => "OG Description"
                        ],
                        [
                            "type" => "textfield",
                            "input" => true,
                            "key" => "twitter_title",
                            "label" => "Twitter Title"
                        ],
                        [
                            "type" => "textarea",
                            "input" => true,
                            "key" => "twitter_description",
                            "label" => "Twitter Description"
                        ]
                    ]
                ],
                [
                    "type" => "button",
                    "label" => "Submit",
                    "key" => "submit",
                    "disableOnInvalid" => true,
                    "input" => true,
                    "tableView" => false,
                    "action" => "submit"
                ]
            ]
        ];

        return view('form')->with([
            'definition' => json_encode($formFields),
            'data' => json_encode($existingData),
            'title' => "Edit Project",
            'submitRoute' => route('project.updateWithForm', $project->id)
        ]);
    }

    public function storeWithForm(Request $request)
    {
        $submittedData = json_decode($request->submissionValues);

        $request->validate([
            'name' => 'required',
            'slug' => 'required',
        ]);

        $slug = $submittedData->slug ? Str::slug($submittedData->slug, '-') : Str::slug($submittedData->name, '-');
        $slug = Str::lower($slug);
        $same_slug_count = Project::where('slug', 'LIKE', $slug . '%')->count();
        $slug_suffix = $same_slug_count ? '-' . ($same_slug_count + 1) : '';
        $slug .= $slug_suffix;

        $project = new Project;
        $project->name = $submittedData->name ?? NULL;
        $project->subtitle = $submittedData->subtitle;
        $project->slug = $slug;
        $project->image = $submittedData->image;
        $project->status = $submittedData->status;
        $project->completion_status = $submittedData->completion_status;
        $project->sort_order = $submittedData->sort_order;
        $project->parent_id = $submittedData->parent_id ?? null;

        $project->highlights = is_array($submittedData->highlights) ? json_encode($submittedData->highlights) : [];

        $gallery = [];
        if (isset($submittedData->gallery_images) && is_array($submittedData->gallery_images)) {
            $count = 1;
            foreach ($submittedData->gallery_images as $image) {
                $gallery[] = $image;
                $count++;
            }
            $project->photos = implode(',', $gallery);
        }

        $project->save();

        $project_translation = ProjectTranslation::firstOrNew(['lang' => $submittedData->lang, 'project_id' => $project->id]);
        $project_translation->name = $submittedData->name;
        $project_translation->description = $submittedData->description;
        $project_translation->meta_title = $submittedData->meta_title;
        $project_translation->meta_description = $submittedData->meta_description;
        $project_translation->meta_keywords = $submittedData->meta_keywords;
        $project_translation->og_title = $submittedData->og_title;
        $project_translation->og_description = $submittedData->og_description;
        $project_translation->twitter_title = $submittedData->twitter_title;
        $project_translation->twitter_description = $submittedData->twitter_description;
        $project_translation->save();

        flash('Project ' . trans('messages.created_msg'))->success();
        return redirect()->route('project.index');
    }

    public function updateWithForm(Request $request, $id)
    {

        $submittedData = json_decode($request->submissionValues);

        $project = Project::findOrFail($id);

        $slug = '';
        if ($submittedData->slug != null) {
            $slug = strtolower(Str::slug($submittedData->slug, '-'));
            $same_slug_count = Project::where('slug', 'LIKE', $slug . '%')->where('id', '!=', $project->id)->count();
            $slug_suffix = $same_slug_count > 0 ? '-' . ($same_slug_count + 1) : '';
            $slug .= $slug_suffix;
        }

        if ($submittedData->lang == env("DEFAULT_LANGUAGE", 'en')) {
            $project->name = $submittedData->name;
            $project->subtitle = $submittedData->subtitle;
            $project->status = $submittedData->status;
            $project->completion_status = $submittedData->completion_status;
            $project->slug = $slug;
            $project->image = $submittedData->image;
            $project->sort_order = $submittedData->sort_order;
            $project->parent_id = $submittedData->parent_id ?? null;


            $project->highlights = is_array($submittedData->highlights) ? json_encode($submittedData->highlights) : [];

            $gallery = [];
            if (isset($submittedData->gallery_images) && is_array($submittedData->gallery_images)) {
                $count = 1;
                foreach ($submittedData->gallery_images as $image) {
                    $gallery[] = $image;
                    $count++;
                }
                $project->photos = implode(',', $gallery);
            }

            $project->save();
        }

        $project_translation = ProjectTranslation::firstOrNew(['lang' => $submittedData->lang, 'project_id' => $project->id]);
        $project_translation->name = $submittedData->name;
        $project_translation->description = $submittedData->description;
        $project_translation->meta_title = $submittedData->meta_title;
        $project_translation->meta_description = $submittedData->meta_description;
        $project_translation->meta_keywords = $submittedData->meta_keywords;
        $project_translation->og_title = $submittedData->og_title;
        $project_translation->og_description = $submittedData->og_description;
        $project_translation->twitter_title = $submittedData->twitter_title;
        $project_translation->twitter_description = $submittedData->twitter_description;
        $project_translation->save();

        flash(trans('messages.project') . trans('messages.updated_msg'))->success();
        return redirect()->route('project.index');
    }

    public function store(Request $request)
    {

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
