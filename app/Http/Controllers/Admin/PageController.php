<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;

use Illuminate\Http\Request;
use App\Models\Page;
use App\Models\PageTranslation;
use App\Models\Category;
use App\Models\Brand;
use App\Models\Occasion;
use App\Models\BusinessSetting;
use App\Models\Banner;
use App\Models\Product;
use App\Models\Contacts;
use App\Models\Subscriber;
use Storage;
use File;
use Illuminate\Support\Facades\Artisan;

class PageController extends Controller
{

    public function index(Request $request)
    {
        $pages = \App\Models\Page::where('status', 1)->orderBy('slug', 'asc')->get();

        return view('backend.website_settings.pages.index', compact('pages'));
    }

    public function create(Request $request)
    {
        $lang = $request->lang;

        $view = $this->getPage('new_page', $lang);
        return $view;
    }

    public function edit(Request $request, $id)
    {
        $lang = $request->lang;
        $page_name = $request->page;
        $page = Page::where('type', $id)->first();
        if ($page != null) {
            $page_id = $page->id;

            $view = $this->getPage($page->type, $lang);
            return $view;
        }
        abort(404);
    }

    public function enquiries()
    {
        $query = Contacts::latest();
        $contact = $query->paginate(20);
        return view('backend.contact', compact('contact'));
    }

    public function destroy($id)
    {
        $page = Page::findOrFail($id);
        foreach ($page->page_translations as $key => $page_translation) {
            $page_translation->delete();
        }
        if (Page::destroy($id)) {
            flash(translate('Page has been deleted successfully'))->success();
            return redirect()->back();
        }
        return back();
    }

    public function show_custom_page($slug)
    {
        $page = Page::where('slug', $slug)->first();
        if ($page != null) {
            return view('frontend.custom_page', compact('page'));
        }
        abort(404);
    }
    public function mobile_custom_page($slug)
    {
        $page = Page::where('slug', $slug)->first();
        if ($page != null) {
            return view('frontend.m_custom_page', compact('page'));
        }
        abort(404);
    }

    public function delete_image(Request $request)
    {
        $page = Page::where('id', $request->id)->first();
        $fil_url = str_replace('/storage/', '', $request->url);
        $fil_url = $path = Storage::disk('public')->path($fil_url);
        if (File::exists($fil_url)) {
            $info = pathinfo($fil_url);
            $file_name = basename($fil_url, '.' . $info['extension']);
            $ext = $info['extension'];

            unlink($fil_url);

            $page_img = explode(',', $page->image);
            $page_img =  array_diff($page_img, [$request->url]);
            if ($page_img) {
                $page->image = implode(',', $page_img);
            } else {
                $page->image = null;
            }

            $page->save();
            return 1;
        } else {
            return 0;
        }
    }

    public function subscribers()
    {
        $subscribers = Subscriber::orderBy('created_at', 'desc')->paginate(15);
        return view('backend.subscribers', compact('subscribers'));
    }


    public function subscribersDestroy($id)
    {
        Subscriber::destroy($id);
        flash(trans('messages.subscriber') . ' ' . trans('messages.deleted_msg'))->success();
        return redirect()->route('subscribers.index');
    }

    public function getPage($type, $lang)
    {

        $page = Page::where('type', $type)->first() ?? $type;

        switch ($type) {
            case 'home':
                $banners = Banner::where('status', 1)->get();

                $categories = Category::where('parent_id', 0)->where('is_active', 1)->with('childrenCategories')->get();

                $categoryOptions = [];
                foreach ($categories as $category) {
                    $categoryOptions[] = ["label" => $category->name, "value" => $category->id];
                }

                $bannersOptionsArray = [];
                foreach ($banners as $banner) {
                    $bannersOptionsArray[] = ["label" => $banner->name, "value" => $banner->id];
                }

                $existingData = [
                    'page_id' => $page->id,
                    'lang' => $lang,
                    'discover_categories' => json_decode(get_setting('discover_categories'), true) ?: [],
                    'image1' => is_array(json_decode($page->getTranslation('image1', $lang))) ? json_decode($page->getTranslation('image1', $lang)) : [],
                    'image2' => is_array(json_decode($page->getTranslation('image2', $lang))) ? json_decode($page->getTranslation('image2', $lang)) : [],
                    'heading2' => $page->getTranslation('heading2', $lang) ?? "",
                    'heading3' => $page->getTranslation('heading3', $lang) ?? "",
                    'heading4' => $page->getTranslation('heading4', $lang) ?? "",
                    'heading5' => $page->getTranslation('heading5', $lang) ? json_decode($page->getTranslation('heading5', $lang)) : "",
                    'new_arrival_products' => json_decode(get_setting('new_arrival_products'), true) ?: [],
                    'meta_title' => $page->getTranslation('meta_title', $lang),
                    'meta_description' => $page->getTranslation('meta_description', $lang),
                    'meta_keywords' => $page->getTranslation('keywords', $lang),
                    'og_title' => $page->getTranslation('og_title', $lang),
                    'og_description' => $page->getTranslation('og_description', $lang),
                    'twitter_title' => $page->getTranslation('twitter_title', $lang),
                    'twitter_description' => $page->getTranslation('twitter_description', $lang),
                ];

                $formFields = [
                    "components" => [
                        [
                            "type" => "panel",
                            "key" => "discover_section",
                            "label" => "Discover Section",
                            "title" => "Discover Section",
                            "hidden" => true,
                            "input" => false,
                            "components" => [
                                [
                                    "type" => "page_id",
                                    "input" => true,
                                    "key" => "page_id",
                                    "value" => "{{ $page->id }}",
                                    "hidden" => true,
                                    "label" => "Heading",
                                ],
                                [
                                    "type" => "lang",
                                    "input" => true,
                                    "key" => "lang",
                                    "value" => "{{ $lang }}",
                                    "hidden" => true,
                                    "label" => "Heading",
                                ],
                            ]
                        ],
                        [
                            "collapsible" => false,
                            "key" => "panel",
                            "type" => "panel",
                            "label" => "Panel",
                            "title"  => "Highlights",
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
                                    "key" => "image1",
                                    "type" => "datagrid",
                                    "input" => true,
                                    "components" => [
                                        [
                                            "label" => "Upload",
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
                                            "key" => "icon",
                                            "type" => "file",
                                            "input" => true
                                        ],
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
                                            "key" => "title",
                                            "type" => "textfield",
                                            "input" => true
                                        ],

                                    ]
                                ],
                            ]
                        ],
                        [
                            "type" => "panel",
                            "key" => "mid_section_banners",
                            "label" => "Mid Section Banners",
                            "title" => "Mid Section Banners",
                            "components" => [
                                [
                                    "type" => "datagrid",
                                    "key" => "heading5",
                                    "label" => "",
                                    "input" => true,
                                    "tableView" => true,
                                    "validate" => [
                                        "maxLength" => 3,
                                        "minLength" => 3
                                    ],
                                    "validateOn" => "change",
                                    "validateRequired" => false,
                                    "addAnotherPosition" => "bottom",
                                    "disableAddingRemovingRows" => true,
                                    "defaultValue" => [],
                                    "components" => [
                                        [
                                            "type" => "select",
                                            "key" => "banner",
                                            "label" => "Select Banner",
                                            "data" => [
                                                'values' => $bannersOptionsArray
                                            ],
                                            "dataSrc" => "values",
                                            "validate" => [
                                                "required" => false
                                            ],
                                            "input" => true,
                                        ],
                                    ]
                                ],
                            ]
                        ],

                        [
                            "type" => "panel",
                            "key" => "panel",
                            "label" => "Whatsapp Section",
                            "title" => "Whatsapp Section",
                            "hidden" => false,
                            "components" => [
                                [
                                    "type" => "textfield",
                                    "input" => true,
                                    "key" => "heading2",
                                    "hidden" => false,
                                    "label" => "Heading",
                                ],
                                [
                                    "type" => "textfield",
                                    "input" => true,
                                    "key" => "heading3",
                                    "hidden" => false,
                                    "label" => "Button Text",
                                ],
                                [
                                    "type" => "textfield",
                                    "input" => true,
                                    "key" => "heading4",
                                    "hidden" => false,
                                    "label" => "Button Link",
                                ],
                            ]
                        ],
                        $this->getSeoFields(),
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
                    'title' => "Edit Home Page",
                    'submitRoute' => route('custom-pages.updatePage')
                ]);

            case 'about_us':

                $existingData = [
                    'page_id' => $page->id,
                    'lang' => $lang,
                    'discover_categories' => json_decode(get_setting('discover_categories'), true) ?: [],
                    'image1' => is_array(json_decode($page->getTranslation('image1', $lang))) ? json_decode($page->getTranslation('image1', $lang)) : [],
                    'image2' => is_array(json_decode($page->getTranslation('image2', $lang))) ? json_decode($page->getTranslation('image2', $lang)) : [],
                    'heading1' => $page->getTranslation('heading1', $lang) ?? "",
                    'heading2' => $page->getTranslation('heading2', $lang) ?? "",
                    'content1' => $page->getTranslation('content1', $lang) ?? "",
                    'heading3' => $page->getTranslation('heading3', $lang) ? json_decode($page->getTranslation('heading3', $lang)) : [],
                    'heading4' => $page->getTranslation('heading4', $lang) ?? "",
                    'heading5' => $page->getTranslation('heading5', $lang) ? json_decode($page->getTranslation('heading5', $lang)) : "",
                    'new_arrival_products' => json_decode(get_setting('new_arrival_products'), true) ?: [],
                    'meta_title' => $page->getTranslation('meta_title', $lang),
                    'meta_description' => $page->getTranslation('meta_description', $lang),
                    'meta_keywords' => $page->getTranslation('keywords', $lang),
                    'og_title' => $page->getTranslation('og_title', $lang),
                    'og_description' => $page->getTranslation('og_description', $lang),
                    'twitter_title' => $page->getTranslation('twitter_title', $lang),
                    'twitter_description' => $page->getTranslation('twitter_description', $lang),
                ];

                $formFields = [
                    "components" => [
                        [
                            "type" => "panel",
                            "key" => "about_us_section",
                            "label" => "About us section",
                            "title" => "About us",
                            "hidden" => true,
                            "input" => false,
                            "components" => [
                                [
                                    "type" => "page_id",
                                    "input" => true,
                                    "key" => "page_id",
                                    "value" => "{{ $page->id }}",
                                    "hidden" => true,
                                    "label" => "Heading",
                                ],
                                [
                                    "type" => "lang",
                                    "input" => true,
                                    "key" => "lang",
                                    "value" => "{{ $lang }}",
                                    "hidden" => true,
                                    "label" => "Heading",
                                ],
                            ]
                        ],
                        [
                            "type" => "panel",
                            "key" => "Main Information",
                            "label" => "Main Information",
                            "title" => "Main Information",
                            "hidden" => false,
                            "input" => false,
                            "components" => [
                                [
                                    "label" => "Content",
                                    "applyMaskOn" => "change",
                                    "editor" => "quill",
                                    "tableView" => true,
                                    "validateWhenHidden" => false,
                                    "key" => "content1",
                                    "type" => "textarea",
                                    "input" => true,
                                    "isUploadEnabled" => true,
                                    "as" => "string",
                                    "uploadStorage" => "base64"
                                ],
                                [
                                    "label" => "Image",
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
                                    "key" => "image1",
                                    "type" => "file",
                                    "input" => true
                                ],
                            ]
                        ],
                        [
                            "collapsible" => false,
                            "key" => "panel",
                            "type" => "panel",
                            "label" => "Panel",
                            "title"  => "Highlights",
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
                                    "initEmpty" => true,
                                    "tableView" => false,
                                    "defaultValue" => [
                                        [
                                            "title_1" => "",
                                            "content_1" => "",
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
                                    "key" => "heading3",
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
                                            "key" => "title_1",
                                            "type" => "textfield",
                                            "input" => true
                                        ],
                                        [
                                            "label" => "Content",
                                            "applyMask" => false,
                                            "applyMaskOn" => "change",
                                            "autoComplete" => "off",
                                            "tableView" => true,
                                            "validate" => [],
                                            "validateOn" => "change",
                                            "validateOnBlur" => false,
                                            "validateOnInput" => false,
                                            "validateRequired" => false,
                                            "key" => "content_1",
                                            "type" => "textfield",
                                            "input" => true
                                        ],
                                    ]
                                ],
                            ]
                        ],
                        $this->getSeoFields(),
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
                    'title' => "Edit About us Page",
                    'submitRoute' => route('custom-pages.updatePage')
                ]);


            default:

                $existingData = [
                    'page_id' => $page->id,
                    'lang' => $lang,
                    'heading1' => $page->getTranslation('heading1', $lang) ?? "",
                    'heading2' => $page->getTranslation('heading2', $lang) ?? "",
                    '4' => $page->getTranslation('4', $lang) ?? "",
                    'heading4' => $page->getTranslation('heading4', $lang) ?? "",
                    'meta_title' => $page->getTranslation('meta_title', $lang) ?? "",
                    'meta_description' => $page->getTranslation('meta_description', $lang) ?? "",
                    'meta_keywords' => $page->getTranslation('keywords', $lang) ?? "",
                    'og_title' => $page->getTranslation('og_title', $lang) ?? "",
                    'og_description' => $page->getTranslation('og_description', $lang) ?? "",
                    'twitter_title' => $page->getTranslation('twitter_title', $lang) ?? "",
                    'twitter_description' => $page->getTranslation('twitter_description', $lang) ?? "",
                ];

                $formFields = [
                    "components" => [
                        $this->getSeoFields(),
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

                return view('form')->with([
                    'definition' => json_encode($formFields),
                    'data' => json_encode($existingData),
                    'title' => "Edit Home Page",
                    'submitRoute' => route('custom-pages.updatePage')
                ]);
        }
    }


    public function updateData(Request $request)
    {

        // return response()->json(['d' => $request->all()]);

        if ($request->get('state') === 'draft') {
        }

        $submittedData = json_decode($request->submissionValues);

        $id = $submittedData->page_id ?? null;

        if ($id) {
            $page = Page::find($id);
        }

        if (empty($page)) {
            $page = new Page;
            $page->type = $submittedData->type ?? 'default';
            $page->save();
        }

        $page_translation = PageTranslation::firstOrNew([
            'lang' => $submittedData->lang ?? 'en',
            'page_id' => $page->id,
        ]);
        $page_translation->title = isset($submittedData->title) ? $submittedData->title : '';
        $page_translation->content = isset($submittedData->content) ? $submittedData->content : '';
        $page_translation->sub_title = isset($submittedData->sub_title) ? $submittedData->sub_title : '';
        $page_translation->heading1 = isset($submittedData->heading1) ? ($submittedData->heading1) : '';
        $page_translation->content1 = isset($submittedData->content1) ? $submittedData->content1 : '';
        $page_translation->heading2 = isset($submittedData->heading2) ? ($submittedData->heading2) : '';
        $page_translation->heading3 = isset($submittedData->heading3) ? ($submittedData->heading3) : '';
        $page_translation->content2 = isset($submittedData->content2) ? $submittedData->content2 : '';
        $page_translation->content3 = isset($submittedData->content3) ? $submittedData->content3 : '';
        $page_translation->content4 = isset($submittedData->content4) ? $submittedData->content4 : '';
        $page_translation->content5 = isset($submittedData->content5) ? $submittedData->content5 : '';
        $page_translation->heading4 = isset($submittedData->heading4) ? $submittedData->heading4 : '';
        $page_translation->heading5 = isset($submittedData->heading5) ? json_encode($submittedData->heading5) : '';
        $page_translation->heading6 = isset($submittedData->heading6) ? $submittedData->heading6 : '';
        $page_translation->heading7 = isset($submittedData->heading7) ? $submittedData->heading7 : '';
        $page_translation->heading8 = isset($submittedData->heading8) ? $submittedData->heading8 : '';
        $page_translation->heading9 = isset($submittedData->heading9) ? $submittedData->heading9 : '';
        $page_translation->meta_title = isset($submittedData->meta_title) ? $submittedData->meta_title : '';
        $page_translation->meta_description = isset($submittedData->meta_description) ? $submittedData->meta_description : '';
        $page_translation->og_title = isset($submittedData->og_title) ? $submittedData->og_title : '';
        $page_translation->og_description = isset($submittedData->og_description) ? $submittedData->og_description : '';
        $page_translation->twitter_title = isset($submittedData->twitter_title) ? $submittedData->twitter_title : '';
        $page_translation->twitter_description = isset($submittedData->twitter_description) ? $submittedData->twitter_description : '';
        $page_translation->keywords = isset($submittedData->keywords) ? $submittedData->keywords : '';
        $page_translation->image1 = isset($submittedData->image1) ? json_encode($submittedData->image1) : '';
        $page_translation->image2 = isset($submittedData->image2) ? json_encode($submittedData->image2) : '';

        $page_translation->save();

        $page->save();

        Artisan::call('cache:clear');

        flash(trans("messages.settings") . ' ' . trans("messages.updated_msg"))->success();
        return back();
    }

    function getSeoFields()
    {
        return    [
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
        ];
    }
}
