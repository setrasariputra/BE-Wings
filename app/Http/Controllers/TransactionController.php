<?php

namespace App\Http\Controllers;

use App\Models\Transaction_detail;
use App\Models\Transaction_header;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class TransactionController extends Controller
{
    public function Read()
    {
        try {
            $data = array();
            $transaction_header_model = new Transaction_header();
            $data = $transaction_header_model->Transaction();

            return response()->json(['status' => 'success', 'message' => 'Ok.', 'data' => $data]);
        } catch (\Exception $e) {
            return response()->json(['status' => 'error', 'message' => $e->getMessage()]);
        }
    }
    public function Checkout(Request $request)
    {
        try {
            DB::beginTransaction();

            // get date
            $date = date('Y-m-d');            

            $token_payload = auth()->payload();
            $user_id = $token_payload['sub'];
            $user_id = (int)$user_id;

            $validated = $this->validate($request, [
                'product_cart' => 'required',
            ]);

            $transaction_header_model = new Transaction_header();

            // get Total
            $total = $transaction_header_model->GetTotal($validated['product_cart']);

            // create transaction headers
            $transaction_header_model = new Transaction_header();
            $transaction_code = $transaction_header_model->CreateTransactionCode();
            if(is_array($transaction_code)) {
                $document_code = $transaction_code['document_code'];
                $document_number = $transaction_code['document_number'];
            }

            // insert transaction header
            $insert = new Transaction_header();
            $insert->document_code = $document_code;
            $insert->document_number = $document_number;
            $insert->user_id = $user_id;
            $insert->total = $total;
            $insert->date = $date;
            $insert->save();
            $transaction_header_id = $insert->id;

            // create transaction details
            foreach($validated['product_cart'] as $val => $key) {
                // insert
                $insert = new Transaction_detail();
                $insert->transaction_header_id = $transaction_header_id;
                $insert->product_id = $key['id'];
                $insert->price = $key['sales_price'];
                $insert->qty = $key['qty'];
                $insert->unit = $key['unit'];
                $insert->subtotal = $key['sales_price'] * $key['qty'];
                $insert->currency = $key['currency'];
                $insert->save();
            }

            DB::commit();
            return response()->json([
                'status' => 'success', 
                'message' => 'Ok.', 
                'data' => $validated['product_cart'], 
                'transaction_code' => $transaction_code,
                'total' => $total,
                'date' => $date,
                'user_id' => $user_id,
            ]);
        } catch (\Exception $e) {
            DB::rollback();
            return response()->json(['status' => 'error', 'message' => $e->getMessage()]);
        }
    }
}
