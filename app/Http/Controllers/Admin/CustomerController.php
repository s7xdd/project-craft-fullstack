<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Address;
use App\Models\Country;
use Illuminate\Http\Request;
use App\Models\Customer;
use App\Models\User;
use App\Models\Order;
use Hash;

class CustomerController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $sort_search = null;
        $users = User::where('user_type', 'customer')->orderBy('created_at', 'desc');
        if ($request->has('search')) {
            $sort_search = $request->search;
            $users->where(function ($q) use ($sort_search) {
                $q->where('name', 'like', '%' . $sort_search . '%')->orWhere('email', 'like', '%' . $sort_search . '%');
            });
        }
        $users = $users->paginate(15);
        return view('backend.customers.index', compact('users', 'sort_search'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $request->validate([
            'name'          => 'required',
            'email'         => 'required|unique:users|email',
            'phone'         => 'required|unique:users',
        ]);

        $response['status'] = 'Error';

        $user = User::create($request->all());

        $customer = new Customer;

        $customer->user_id = $user->id;
        $customer->save();

        if (isset($user->id)) {
            $html = '';
            $html .= '<option value="">
                        ' . trans("messages.walk_in_customer") . '
                    </option>';
            foreach (Customer::all() as $key => $customer) {
                if ($customer->user) {
                    $html .= '<option value="' . $customer->user->id . '" data-contact="' . $customer->user->email . '">
                                ' . $customer->user->name . '
                            </option>';
                }
            }

            $response['status'] = 'Success';
            $response['html'] = $html;
        }

        echo json_encode($response);
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $customer = User::where('user_type', 'customer')->with(['addresses', 'addresses.country', 'addresses.state', 'addresses.city'])->withCount(['orders'])->findOrFail($id);
        // dd($customer);

        $country = Country::all();

        return view('backend.customers.edit', compact('customer', 'country'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $request->validate([
            'name' => 'required',
            // 'password' => 'sometimes|confirmed'
            'password' => 'nullable|min:6|confirmed',
        ]);

        $user = User::findOrFail($id);

        $user->name = $request->name;
        $user->phone = $request->phone;

        if ($request->password) {
            $user->password = Hash::make($request->password);
        }

        $user->save();

        flash(trans('messages.customer').' '.trans('messages.updated_msg'))->success();
        return redirect()->back();
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        User::destroy($id);
        flash(trans('messages.customer').' '.trans('messages.deleted_msg'))->success();
        return redirect()->route('customers.index');
    }

    public function bulk_customer_delete(Request $request)
    {
        if ($request->id) {
            foreach ($request->id as $customer_id) {
                $this->destroy($customer_id);
            }
        }

        return 1;
    }

    public function login($id)
    {
        $user = User::findOrFail(decrypt($id));

        auth()->login($user, true);

        return redirect()->route('dashboard');
    }

    public function ban($id)
    {
        $user = User::findOrFail(decrypt($id));

        if ($user->banned == 1) {
            $user->banned = 0;
            flash(trans('messages.customer').' '.trans('messages.unbanned').' '.trans('messages.successfully'))->success();
        } else {
            $user->banned = 1;
            flash(trans('messages.customer').' '.trans('messages.banned').' '.trans('messages.successfully'))->success();
        }

        $user->save();

        return back();
    }


    public function create_address($user_id)
    {
    }

    public function delete_address($user_id, $id)
    {
        Address::where([
            'id' => $id,
            'user_id' => $user_id
        ])->delete();

        flash('Address deleted.')->success();
        return back();
    }

    public function update_address($user_id, $id)
    {
    }

    public function address_set_default($user_id, $id)
    {
        Address::where('user_id', $user_id)->update([
            'set_default' => 0
        ]);

        $address = Address::findOrFail($id);
        $address->set_default = 1;
        $address->save();

        return back();
    }
}
