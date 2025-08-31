<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Service;
use App\Models\ServiceTranslation;
use Illuminate\Support\Str;
use DB;

class ServiceController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
        $this->middleware('permission:manage_services', ['only' => ['index', 'create', 'store', 'edit', 'update', 'destroy']]);
    }

    public function index(Request $request)
    {
        $sort_search = null;
        $services = Service::with('parent')->orderBy('sort_order', 'asc');

        if ($request->has('search')) {
            $sort_search = $request->search;
            $services = $services->where('name', 'like', '%' . $sort_search . '%');
        }

        $services = $services->paginate(15);

        return view('backend.services.index', compact('services', 'sort_search'));
    }

    public function create()
    {
        $services = Service::whereNull('parent_id')->get();
        $all_services = Service::whereNull('parent_id')->get();

        return view('backend.services.create', compact('services', 'all_services'));
    }

    public function createWithForm(Request $request)
    {
        $lang = $request->lang ?? env('DEFAULT_LANGUAGE', 'en');
        
        $existingData = [
            'service_id' => null,
            'lang' => $lang,
            'name' => '',
            'description' => '',
            'slug' => '',
            'image' => '',
            'price' => '',
            'status' => 1,
            'sort_order' => 0,
            'parent_id' => null,
            'meta_title' => '',
            'meta_description' => '',
            'meta_keywords' => '',
            'og_title' => '',
            'og_description' => '',
            'twitter_title' => '',
            'twitter_description' => '',
        ];

        $all_services = Service::whereNull('parent_id')->get();
        $serviceOptions = [];
        foreach ($all_services as $service) {
            $serviceOptions[] = ["label" => $service->name, "value" => $service->id];
        }

        $formFields = [
            "components" => [
                [
                    "type" => "panel",
                    "key" => "basic_info",
                    "label" => "Basic Information",
                    "input" => false,
                    "components" => [
                        [
                            "type" => "hidden",
                            "input" => true,
                            "key" => "service_id",
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
                            "label" => "Service Name",
                            "validate" => [
                                "required" => true
                            ]
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
                            "label" => "Parent Service",
                            "data" => [
                                "values" => $serviceOptions
                            ],
                            "multiple" => false
                        ],
                        [
                            "label" => "Service Image",
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
                            "type" => "textfield",
                            "input" => true,
                            "key" => "price",
                            "label" => "Price"
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
                        ]
                    ]
                ],
                [
                    "type" => "panel",
                    "key" => "description",
                    "label" => "Description",
                    "input" => false,
                    "components" => [
                        [
                            "type" => "textarea",
                            "input" => true,
                            "key" => "description",
                            "label" => "Description"
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
            'title' => "Add New Service",
            'submitRoute' => route('service.storeWithForm')
        ]);
    }

    public function editWithForm(Request $request, $id)
    {
        $lang = $request->lang ?? env('DEFAULT_LANGUAGE', 'en');
        $service = Service::findOrFail($id);
        
        $existingData = [
            'service_id' => $service->id,
            'lang' => $lang,
            'name' => $service->getTranslation('name', $lang),
            'description' => $service->getTranslation('description', $lang),
            'slug' => $service->slug,
            'image' => $service->image,
            'price' => $service->price,
            'status' => $service->status,
            'sort_order' => $service->sort_order,
            'parent_id' => $service->parent_id,
            'meta_title' => $service->getTranslation('meta_title', $lang),
            'meta_description' => $service->getTranslation('meta_description', $lang),
            'meta_keywords' => $service->getTranslation('meta_keywords', $lang),
            'og_title' => $service->getTranslation('og_title', $lang),
            'og_description' => $service->getTranslation('og_description', $lang),
            'twitter_title' => $service->getTranslation('twitter_title', $lang),
            'twitter_description' => $service->getTranslation('twitter_description', $lang),
        ];

        $all_services = Service::whereNull('parent_id')->where('id', '!=', $id)->get();
        $serviceOptions = [];
        foreach ($all_services as $serv) {
            $serviceOptions[] = ["label" => $serv->name, "value" => $serv->id];
        }

        $formFields = [
            "components" => [
                [
                    "type" => "panel",
                    "key" => "basic_info",
                    "label" => "Basic Information",
                    "input" => false,
                    "components" => [
                        [
                            "type" => "hidden",
                            "input" => true,
                            "key" => "service_id",
                            "value" => "{{ $service->id }}",
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
                            "label" => "Service Name",
                            "validate" => [
                                "required" => true
                            ]
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
                            "label" => "Parent Service",
                            "data" => [
                                "values" => $serviceOptions
                            ],
                            "multiple" => false
                        ],
                        [
                            "label" => "Service Image",
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
                            "type" => "textfield",
                            "input" => true,
                            "key" => "price",
                            "label" => "Price"
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
                        ]
                    ]
                ],
                [
                    "type" => "panel",
                    "key" => "description",
                    "label" => "Description",
                    "input" => false,
                    "components" => [
                        [
                            "type" => "textarea",
                            "input" => true,
                            "key" => "description",
                            "label" => "Description"
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
            'title' => "Edit Service",
            'submitRoute' => route('service.updateWithForm', $service->id)
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
        $same_slug_count = Service::where('slug', 'LIKE', $slug . '%')->count();
        $slug_suffix = $same_slug_count ? '-' . ($same_slug_count + 1) : '';
        $slug .= $slug_suffix;

        $service = new Service;
        $service->name = $submittedData->name ?? NULL;
        $service->slug = $slug;
        $service->price = $submittedData->price;
        $service->image = $submittedData->image;
        $service->status = $submittedData->status;
        $service->sort_order = $submittedData->sort_order;
        $service->parent_id = $submittedData->parent_id ?? null;
        $service->save();

        $service_translation = ServiceTranslation::firstOrNew(['lang' => $submittedData->lang, 'service_id' => $service->id]);
        $service_translation->name = $submittedData->name;
        $service_translation->description = $submittedData->description;
        $service_translation->meta_title = $submittedData->meta_title;
        $service_translation->meta_description = $submittedData->meta_description;
        $service_translation->meta_keywords = $submittedData->meta_keywords;
        $service_translation->og_title = $submittedData->og_title;
        $service_translation->og_description = $submittedData->og_description;
        $service_translation->twitter_title = $submittedData->twitter_title;
        $service_translation->twitter_description = $submittedData->twitter_description;
        $service_translation->save();

        flash('Service ' . trans('messages.created_msg'))->success();
        return redirect()->route('service.index');
    }

    public function updateWithForm(Request $request, $id)
    {
        $submittedData = json_decode($request->submissionValues);
        
        $request->validate([
            'name' => 'required',
            'slug' => 'required',
        ]);

        $service = Service::findOrFail($id);

        $slug = '';
        if ($submittedData->slug != null) {
            $slug = strtolower(Str::slug($submittedData->slug, '-'));
            $same_slug_count = Service::where('slug', 'LIKE', $slug . '%')->where('id', '!=', $service->id)->count();
            $slug_suffix = $same_slug_count > 0 ? '-' . ($same_slug_count + 1) : '';
            $slug .= $slug_suffix;
        }

        if ($submittedData->lang == env("DEFAULT_LANGUAGE", 'en')) {
            $service->name = $submittedData->name;
            $service->status = $submittedData->status;
            $service->slug = $slug;
            $service->price = $submittedData->price;
            $service->image = $submittedData->image;
            $service->sort_order = $submittedData->sort_order;
            $service->parent_id = $submittedData->parent_id ?? null;
            $service->save();
        }

        $service_translation = ServiceTranslation::firstOrNew(['lang' => $submittedData->lang, 'service_id' => $service->id]);
        $service_translation->name = $submittedData->name;
        $service_translation->description = $submittedData->description;
        $service_translation->meta_title = $submittedData->meta_title;
        $service_translation->meta_description = $submittedData->meta_description;
        $service_translation->meta_keywords = $submittedData->meta_keywords;
        $service_translation->og_title = $submittedData->og_title;
        $service_translation->og_description = $submittedData->og_description;
        $service_translation->twitter_title = $submittedData->twitter_title;
        $service_translation->twitter_description = $submittedData->twitter_description;
        $service_translation->save();

        flash(trans('messages.service') . trans('messages.updated_msg'))->success();
        return redirect()->route('service.index');
    }

    public function store(Request $request)
    {
        $request->validate([
            'name' => 'required',
            'slug' => 'required',
        ]);

        $slug = $request->slug ? Str::slug($request->slug, '-') : Str::slug($request->name, '-');
        $slug = Str::lower($slug);
        $same_slug_count = Service::where('slug', 'LIKE', $slug . '%')->count();
        $slug_suffix = $same_slug_count ? '-' . ($same_slug_count + 1) : '';
        $slug .= $slug_suffix;

        $service = new Service;
        $service->name = $request->name ?? NULL;
        $service->slug = $slug;
        $service->price = $request->price;
        $service->image = $request->image;
        $service->status = $request->status;
        $service->sort_order = $request->sort_order;
        $service->parent_id = $request->parent_id ?? null;
        $service->save();

        $service_translation = ServiceTranslation::firstOrNew(['lang' => env('DEFAULT_LANGUAGE'), 'service_id' => $service->id]);
        $service_translation->name = $request->name;
        $service_translation->description = $request->description;
        $service_translation->meta_title = $request->meta_title;
        $service_translation->meta_description = $request->meta_description;
        $service_translation->meta_keywords = $request->meta_keywords;
        $service_translation->og_title = $request->og_title;
        $service_translation->og_description = $request->og_description;
        $service_translation->twitter_title = $request->twitter_title;
        $service_translation->twitter_description = $request->twitter_description;
        $service_translation->save();

        flash('Service ' . trans('messages.created_msg'))->success();
        return redirect()->route('service.index');
    }

    public function edit(Request $request, $id)
    {
        $lang = $request->lang;
        $service = Service::findOrFail($id);
        $all_services = Service::whereNull('parent_id')->where('id', '!=', $id)->get();

        return view('backend.services.edit', compact('service', 'lang', 'all_services'));
    }

    public function update(Request $request, $id)
    {
        $request->validate([
            'name' => 'required',
            'slug' => 'required',
        ]);

        $service = Service::findOrFail($id);

        $slug = '';
        if ($request->slug != null) {
            $slug = strtolower(Str::slug($request->slug, '-'));
            $same_slug_count = Service::where('slug', 'LIKE', $slug . '%')->where('id', '!=', $service->id)->count();
            $slug_suffix = $same_slug_count > 0 ? '-' . ($same_slug_count + 1) : '';
            $slug .= $slug_suffix;
        }

        if ($request->lang == env("DEFAULT_LANGUAGE", 'en')) {
            $service->name = $request->name;
            $service->status = $request->status;
            $service->slug = $slug;
            $service->price = $request->price;
            $service->image = $request->image;
            $service->sort_order = $request->sort_order;
            $service->parent_id = $request->parent_id ?? null;
            $service->save();
        }

        $service_translation = ServiceTranslation::firstOrNew(['lang' => $request->lang, 'service_id' => $service->id]);
        $service_translation->name = $request->name;
        $service_translation->description = $request->description;
        $service_translation->meta_title = $request->meta_title;
        $service_translation->meta_description = $request->meta_description;
        $service_translation->meta_keywords = $request->meta_keywords;
        $service_translation->og_title = $request->og_title;
        $service_translation->og_description = $request->og_description;
        $service_translation->twitter_title = $request->twitter_title;
        $service_translation->twitter_description = $request->twitter_description;
        $service_translation->save();

        flash(trans('messages.service') . trans('messages.updated_msg'))->success();
        return redirect()->route('service.index');
    }

    public function destroy($id)
    {
        Service::destroy($id);
        flash(trans('messages.service') . trans('messages.deleted_msg'))->success();
        return redirect()->route('service.index');
    }

    public function updateStatus(Request $request)
    {
        $service = Service::findOrFail($request->id);
        $service->status = $request->status;
        $service->save();
        return 1;
    }
}
