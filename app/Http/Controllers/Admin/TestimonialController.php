<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Testimonials;
use Illuminate\Http\Request;
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
        $lang = $request->lang ?? 'en';

        $formFields = [
            "components" => [

                [
                    "type" => "panel",
                    "key" => "testimonals",
                    "label" => "Testimonial Information",
                    "title" => "Testimonial Information",
                    "collapsible" => true,
                    "input" => false,
                    "components" => [

                        [
                            "type" => "hidden",
                            "key" => "lang",
                            "value" => $lang,
                        ],
                        [
                            "type" => "textfield",
                            "key" => "name",
                            "label" => "Name",
                            "placeholder" => "Enter customer name",
                            "validate" => [
                                "required" => true
                            ]
                        ],
                        [
                            "type" => "textfield",
                            "key" => "title",
                            "label" => "Title/Designation",
                            "placeholder" => "Enter customer title or designation"
                        ],
                        [
                            "label" => "Upload",
                            "tableView" => false,
                            "storage" => "base64",
                            "webcam" => false,
                            "image" => true,
                            "multiple" => false,
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
                            "key" => "comment",
                            "label" => "Testimonial Comment",
                            "placeholder" => "Enter testimonial comment",
                            "rows" => 5,
                            "validate" => [
                                "required" => true
                            ]
                        ],
                        [
                            "type" => "number",
                            "key" => "sort_order",
                            "label" => "Sort Order",
                            "placeholder" => "Enter sort order (numeric)"
                        ],
                        [
                            "type" => "select",
                            "key" => "status",
                            "label" => "Status",
                            "data" => [
                                "values" => [
                                    ["label" => "Active", "value" => "1"],
                                    ["label" => "Inactive", "value" => "0"]
                                ]
                            ],
                            "defaultValue" => "1"
                        ]
                    ],

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

        $existingData = [
            'lang' => $lang,
            'name' => '',
            'title' => '',
            'comment' => '',
            'sort_order' => 0,
            'status' => '1'
        ];

        return view('form')->with([
            'definition' => json_encode($formFields),
            'data' => json_encode($existingData),
            'title' => "Create New Testimonial",
            'submitRoute' => route('testimonials.store')
        ]);
    }

    public function store(Request $request)
    {
        $submittedData = json_decode($request->submissionValues);

        $request->validate([
            'submissionValues' => 'required'
        ]);

        $data = [
            'name' => $submittedData->name ?? '',
            'title' => $submittedData->title ?? '',
            'comment' => $submittedData->comment ?? '',
            'sort_order' => ($submittedData->sort_order != '') ? $submittedData->sort_order : 0,
            'status' => $submittedData->status ?? '1'
        ];

        $testimonial = Testimonials::create($data);

        return redirect()->route('testimonials.index')->with([
            'status' => "Testimonial created successfully"
        ]);
    }

    public function edit(Request $request, Testimonials $testimonial)
    {
        $lang = $request->lang ?? 'en';

        $formFields = [
            "components" => [
                [
                    "type" => "panel",
                    "key" => "testimonals",
                    "label" => "Testimonial Information",
                    "title" => "Testimonial Information",
                    "collapsible" => true,
                    "input" => false,
                    "components" => [
                        [
                            "type" => "hidden",
                            "key" => "testimonial_id",
                            "value" => $testimonial->id,
                        ],
                        [
                            "type" => "hidden",
                            "key" => "lang",
                            "value" => $lang,
                        ],
                        [
                            "type" => "textfield",
                            "key" => "name",
                            "label" => "Name",
                            "placeholder" => "Enter customer name",
                            "validate" => [
                                "required" => true
                            ]
                        ],
                        [
                            "type" => "textfield",
                            "key" => "title",
                            "label" => "Title/Designation",
                            "placeholder" => "Enter customer title or designation"
                        ],
                        [
                            "label" => "Upload",
                            "tableView" => false,
                            "storage" => "base64",
                            "webcam" => false,
                            "image" => true,
                            "multiple" => false,
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
                            "key" => "comment",
                            "label" => "Testimonial Comment",
                            "placeholder" => "Enter testimonial comment",
                            "rows" => 5,
                            "validate" => [
                                "required" => true
                            ]
                        ],
                        [
                            "type" => "number",
                            "key" => "sort_order",
                            "label" => "Sort Order",
                            "placeholder" => "Enter sort order (numeric)"
                        ],
                        [
                            "type" => "select",
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
                    "type" => "button",
                    "label" => "Submit",
                    "key" => "submit",
                    "disableOnInvalid" => false,
                    "input" => true,
                    "tableView" => false,
                    "action" => "submit"
                ]
            ]
        ];

        $existingData = [
            'testimonial_id' => $testimonial->id,
            'lang' => $lang,
            'name' => $testimonial->name,
            'title' => $testimonial->title,
            'image' => $testimonial->image ? json_decode($testimonial->image) : [],
            'comment' => $testimonial->comment,
            'sort_order' => $testimonial->sort_order,
            'status' => $testimonial->status
        ];

        return view('form')->with([
            'definition' => json_encode($formFields),
            'data' => json_encode($existingData),
            'title' => "Edit Testimonial",
            'submitRoute' => route('testimonials.update', $testimonial->id)
        ]);
    }

    public function update(Request $request, Testimonials $testimonial)
    {
        $submittedData = json_decode($request->submissionValues);

        $request->validate([
            'submissionValues' => 'required'
        ]);

        $testimonial->name = $submittedData->name ?? '';
        $testimonial->title = $submittedData->title ?? '';
        $testimonial->comment = $submittedData->comment ?? '';
        $testimonial->image = json_encode($submittedData->image) ?? '';
        $testimonial->sort_order = ($submittedData->sort_order != '') ? $submittedData->sort_order : 0;
        $testimonial->status = $submittedData->status ?? '1';
        $testimonial->save();

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
