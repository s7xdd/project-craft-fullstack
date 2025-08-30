<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class FormController extends Controller
{

    public function create()
    {
        $form = [
            "components" => [
                [
                    "collapsible" => false,
                    "key" => "panel",
                    "type" => "panel",
                    "label" => "Panel",
                    "input" => false,
                    "tableView" => false,
                    "components" => [
                        [
                            "label" => "Tabs",
                            "components" => [
                                [
                                    "label" => "Tab 1",
                                    "key" => "tab1",
                                    "components" => [
                                        [
                                            "label" => "Text Field",
                                            "applyMaskOn" => "change",
                                            "tableView" => true,
                                            "validateWhenHidden" => false,
                                            "key" => "textField2",
                                            "type" => "textfield",
                                            "input" => true
                                        ]
                                    ]
                                ],
                                [
                                    "label" => "tab 2",
                                    "key" => "tab2",
                                    "components" => [
                                        [
                                            "label" => "Number",
                                            "applyMaskOn" => "change",
                                            "mask" => false,
                                            "tableView" => false,
                                            "delimiter" => false,
                                            "requireDecimal" => false,
                                            "inputFormat" => "plain",
                                            "truncateMultipleSpaces" => false,
                                            "validateWhenHidden" => false,
                                            "key" => "number",
                                            "type" => "number",
                                            "input" => true
                                        ]
                                    ]
                                ]
                            ],
                            "key" => "tabs",
                            "type" => "tabs",
                            "input" => false,
                            "tableView" => false
                        ],
                        [
                            "label" => "Text Field",
                            "applyMaskOn" => "change",
                            "tableView" => true,
                            "validateWhenHidden" => false,
                            "key" => "textField",
                            "type" => "textfield",
                            "input" => true
                        ],
                        [
                            "label" => "Tags",
                            "customClass" => "test-new",
                            "tableView" => false,
                            "validateWhenHidden" => false,
                            "key" => "tags",
                            "type" => "tags",
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
                        ],
                        [
                            "label" => "Subscription ",
                            "optionsLabelPosition" => "right",
                            "inline" => false,
                            "tableView" => false,
                            "values" => [
                                ["label" => "Yes", "value" => "yes", "shortcut" => ""],
                                ["label" => "No", "value" => "no", "shortcut" => ""]
                            ],
                            "validate" => ["required" => true],
                            "validateWhenHidden" => false,
                            "errorLabel" => "Subscription is required",
                            "key" => "subscription_requred",
                            "type" => "radio",
                            "input" => true
                        ],
                        [
                            "label" => "Upload",
                            "tableView" => false,
                            "storage" => "url",
                            "dir" => "/uploads/test",
                            "image" => true,
                            "webcam" => false,
                            "fileTypes" => [
                                ["label" => "", "value" => ""]
                            ],
                            "validateWhenHidden" => false,
                            "key" => "file",
                            "type" => "file",
                            "input" => true
                        ]
                    ]
                ],
                [
                    "type" => "button",
                    "label" => "Submit",
                    "key" => "submit",
                    "disableOnInvalid" => true,
                    "input" => true,
                    "tableView" => false
                ]
            ]
        ];



        return view('form')->with([
            'definition' => json_encode($form),
            'data' => '{}',
        ]);
    }



    public function store(Request $request)
    {
        if ($request->get('state') === 'draft') {
        }

        dd($request->all());


        $data = $request->validateDynamicForm(
            FormDefinition::find(1),
            $request->get('submissionValues')
        );
    }
}
