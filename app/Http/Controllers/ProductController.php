<?php

namespace App\Http\Controllers;

use App\Models\Product;
use App\Models\Product_image;
use App\Models\Product_stock;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class ProductController extends Controller
{
    public function Read()
    {
        try {
            $product_model = new Product();
            $products = $product_model->Read();

            return response()->json(['status' => 'success', 'data' => $products]);
        } catch (\Exception $e) {
            return response()->json(['status' => 'error', 'message' => $e->getMessage()]);
        }
    }

    public function Store(Request $request)
    {
        try {
            DB::beginTransaction();

            $validated = $this->validate($request, [
                'product_code' => 'required',
                'product_name' => 'required',
                'price' => 'required',
                'dimension' => 'required',
            ]);

            $cmodel = new Product();
            $table_column = $cmodel->getTableColumns();
            $exclude = array('id', 'created_at', 'updated_at', 'deleted_at');
            $datarequest = array_diff($table_column, $exclude);

            $id = $request->id;
            $data = Product::find($id);
            if ($data == null) {
                // insert
                if (Product::where('product_code', '=', $validated['product_code'])->exists()) {
                    return response()->json(['status' => 'error', 'message' => 'Product Code is exists.']);
                } else
                if (Product::where('product_name', '=', $validated['product_name'])->exists()) {
                    return response()->json(['status' => 'error', 'message' => 'Product Name is exists. (' . $validated['product_name'] . ')']);
                } else {
                    // insert product
                    $insert = new Product();
                    foreach ($datarequest as $val => $key) {
                        $insert->$key = $request->$key;
                    }
                    if (!empty($request->discount)) {
                        $insert->discount = $request->discount;
                    }
                    $insert->currency = 'IDR';
                    $insert->unit = 'PCS';
                    $insert->save();
                }
                DB::commit();
                return response()->json(['status' => 'success', 'message' => 'Successfully submit data.']);
            } else {
                DB::rollback();
                return response()->json(['status' => 'error', 'message' => 'Cannot insert data.']);
            }
        } catch (\Exception $e) {
            DB::rollback();
            return response()->json(['status' => 'error', 'message' => $e->getMessage()]);
        }
    }

    public function Update(Request $request)
    {
        try {
            DB::beginTransaction();

            $validated = $this->validate($request, [
                'product_code' => 'required',
                'product_name' => 'required',
                'price' => 'required',
                'dimension' => 'required',
            ]);

            $cmodel = new Product();
            $table_column = $cmodel->getTableColumns();
            $exclude = array('id', 'created_at', 'updated_at', 'deleted_at');
            $datarequest = array_diff($table_column, $exclude);

            $id = $request->id;
            $data = Product::find($id);
            if ($data == null) {
                return response()->json(['status' => 'error', 'message' => 'Data tidak ditemukan.']);
            } else {
                // update
                if (Product::where('product_code', '=', $validated['product_code'])->where('id', '!=', $id)->exists()) {
                    return response()->json(['status' => 'error', 'message' => 'Product Code is exists.']);
                } else
                if (Product::where('product_name', '=', $validated['product_name'])->where('id', '!=', $id)->exists()) {
                    return response()->json(['status' => 'error', 'message' => 'Product Name is exists. (' . $validated['product_name'] . ')']);
                } else {
                    // update product
                    $update = Product::findOrFail($id);
                    foreach ($datarequest as $val => $key) {
                        $update->$key = $request->$key;
                    }
                    if (!empty($request->discount)) {
                        $update->discount = $request->discount;
                    }
                    $update->currency = 'IDR';
                    $update->unit = 'PCS';
                    $update->save();
                }
                DB::commit();
                return response()->json(['status' => 'success', 'message' => 'Successfully submit data.']);
            }
        } catch (\Exception $e) {
            DB::rollback();
            return response()->json(['status' => 'error', 'message' => $e->getMessage()]);
        }
    }

    public function Delete($id)
    {
        try {
            $delete = Product::find($id);
            $delete->delete();
            return response()->json(['status' => 'success', 'message' => 'Successfully delete data.']);
        } catch (\Exception $e) {
            return response()->json(['status' => 'error', 'message' => $e->getMessage()]);
        }
    }

    public function StoreImage(Request $request, $id)
    {
        try {
            $type = $request->type;
            $file_upload = $request->file('file_upload');
            $folder = './uploads/products';
            $rand = time();

            $file_name = $file_upload->getClientOriginalName();
            $desc = $file_name;
            $file_type = $file_upload->getClientOriginalExtension();
            $file_size = $file_upload->getSize();
            $file_mimetype = $file_upload->getMimeType();

            $file_name = str_replace(' ', '-', $rand . $file_name);
            $file_upload->move($folder, $file_name);

            // check insert or update
            $product_id = $id;
            $product = Product::where('id', $product_id)->first();
            $data = Product_image::where('product_id', $product_id)->first();
            if (empty($data)) {
                // insert
                $insert = new Product_image();
                $insert->product_id = $product_id;
                $insert->filename = $file_name;
                $insert->filesize = $file_size;
                $insert->filetype = $file_type;
                $insert->fileurl = $folder;
                $insert->save();
                $product_image_id = $insert->id;

                $product_image = Product_image::where('id', $product_image_id)->first();

                $data = array(
                    'product' =>  $product,
                    'image' => $product_image,
                );

                return response()->json(['status' => 'success', 'message' => 'Data updated successfully', 'data' => $data]);
            } else {
                // update 
                $id = $data['id'];
                $update = Product_image::findOrFail($id);
                $update->filename = $file_name;
                $update->filesize = $file_size;
                $update->filetype = $file_type;
                $update->fileurl = $folder;
                $update->save();

                $product_image = Product_image::where('id', $id)->first();

                $data = array(
                    'product' =>  $data,
                    'image' => $product_image,
                );
            }

            return response()->json(['status' => 'success', 'message' => 'Data updated successfully', 'data' => $data]);
        } catch (\Exception $e) {
            return response()->json(['status' => 'error', 'message' => $e->getMessage()]);
        }
    }
}
