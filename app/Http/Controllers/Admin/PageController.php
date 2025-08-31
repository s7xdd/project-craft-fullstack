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

            $view = $this->getPage($id, $lang);
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

    public function getPage($id, $lang)
    {

        $page = Page::where('type', $id)->first() ?? $id;

        switch ($id) {
            case 'about_us':
                $banners = Banner::where('status', 1)->get();
                $current_banners = BusinessSetting::whereIn('type', array('home_banner', 'home_mid_section_banner', 'home_center_banner', 'home_mid_banner', 'home_large_banner'))->get()->keyBy('type');


                $categories = Category::where('parent_id', 0)->where('is_active', 1)->with('childrenCategories')->get();

                $products = Product::select('id', 'name')->where('published', 1)->get();
                $brands = Brand::where('is_active', 1)->orderBy('name', 'asc')->get();

                $productsOptions = [];
                foreach ($products as $product) {
                    $productOptions[] = ["label" => $product->name, "value" => $product->id];
                }

                $categoryOptions = [];
                foreach ($categories as $category) {
                    $categoryOptions[] = ["label" => $category->name, "value" => $category->id];
                }

                $existingData = [
                    'page_id' => $page->id,
                    'lang' => $lang,
                    'heading1' => json_decode($page->getTranslation('heading1', $lang)),
                    'discover_categories' => json_decode(get_setting('discover_categories'), true) ?: [],
                    'home_mid_banner_1' => $current_banners['home_mid_banner'] ? json_decode($current_banners['home_mid_banner']->value)[0] : null,
                    'home_mid_banner_2' => $current_banners['home_mid_banner'] ? json_decode($current_banners['home_mid_banner']->value)[1] : null,
                    'image1' => is_array(json_decode($page->getTranslation('image1', $lang))) ? json_decode($page->getTranslation('image1', $lang)) : [],
                    'image2' => is_array(json_decode($page->getTranslation('image2', $lang))) ? json_decode($page->getTranslation('image2', $lang)) : [],
                    'heading2' => $page->getTranslation('heading2', $lang),
                    'new_arrival_products' => json_decode(get_setting('new_arrival_products'), true) ?: [],
                    'heading4' => $page->getTranslation('heading4', $lang),
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
                                [
                                    "type" => "select",
                                    "input" => true,
                                    "key" => "heading1",
                                    "label" => "Categories (Max 4)",
                                    "multiple" => true,
                                    "validate" => [
                                        "maxLength" => 4
                                    ],
                                    "data" => [
                                        "values" => $categoryOptions
                                    ]
                                ],
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
                                    "key" => "image1",
                                    "type" => "file",
                                    "input" => true
                                ],
                            ]
                        ],
                        [
                            "type" => "panel",
                            "key" => "new_arrivals",
                            "label" => "New Arrivals",
                            "input" => false,
                            "components" => [
                                [
                                    "type" => "textfield",
                                    "input" => true,
                                    "key" => "heading2",
                                    "label" => "Heading",

                                ],
                                [
                                    "type" => "select",
                                    "input" => true,
                                    "key" => "new_arrival_products",
                                    "label" => "Products (Max 4)",
                                    "multiple" => true,
                                    "validate" => [
                                        "maxLength" => 4
                                    ],
                                    "data" => [
                                        "values" => $productsOptions
                                    ]
                                ]
                            ]
                        ],
                        [
                            "type" => "panel",
                            "key" => "special_products",
                            "label" => "Special Products",
                            "input" => false,
                            "components" => [
                                [
                                    "type" => "textfield",
                                    "input" => true,
                                    "key" => "heading4",
                                    "label" => "Heading",

                                ],
                                [
                                    "type" => "select",
                                    "input" => true,
                                    "key" => "special_products",
                                    "label" => "Products (Max 4)",
                                    "multiple" => true,
                                    "validate" => [
                                        "maxLength" => 4
                                    ],
                                    "data" => [
                                        "values" => [
                                            // Fill dynamically with products data as above
                                        ]
                                    ]
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
                    'title' => "Edit Home Page",
                    'submitRoute' => route('custom-pages.updatePage')
                ]);


            default:

                $existingData = [
                    'page_id' => $page->id,
                    'lang' => $lang,
                    'heading1' => json_decode($page->getTranslation('heading1', $lang)) ?? "",
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
                                    "wysiwyg" => true,
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
        $page_translation->heading1 = isset($submittedData->heading1) ? $submittedData->heading1 : '';
        $page_translation->content1 = isset($submittedData->content1) ? $submittedData->content1 : '';
        $page_translation->heading2 = isset($submittedData->heading2) ? $submittedData->heading2 : '';
        $page_translation->content2 = isset($submittedData->content2) ? $submittedData->content2 : '';
        $page_translation->heading3 = isset($submittedData->heading3) ? $submittedData->heading3 : '';
        $page_translation->content3 = isset($submittedData->content3) ? $submittedData->content3 : '';
        $page_translation->content4 = isset($submittedData->content4) ? $submittedData->content4 : '';
        $page_translation->content5 = isset($submittedData->content5) ? $submittedData->content5 : '';
        $page_translation->heading4 = isset($submittedData->heading4) ? $submittedData->heading4 : '';
        $page_translation->heading5 = isset($submittedData->heading5) ? $submittedData->heading5 : '';
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
}
