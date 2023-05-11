<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Transaction_header extends Model
{
    use HasFactory;
    use SoftDeletes;

    protected $dates = ['deleted_at'];

    public function getTableColumns()
    {
        return $this->getConnection()->getSchemaBuilder()->getColumnListing($this->getTable());
    }

    public function Transaction()
    {
        $output = array();

        $data = array();

        $transaction = Transaction_header::select(
            'transaction_headers.id',
            'transaction_headers.document_code',
            'transaction_headers.document_number',
            'transaction_headers.user_id',
            'transaction_headers.document_code',
            'transaction_headers.total',
            'transaction_headers.created_at',
            'transaction_headers.date',
            'users.user'
        )->join('users', 'users.id', '=', 'transaction_headers.user_id')
            ->orderBy('transaction_headers.id', 'DESC')
            ->get();

        if (!empty($transaction)) {
            foreach ($transaction as $val => $key) {
                $transaction_code = $this->SetTransactionCode($key->document_code, $key->document_number);
                $transaction_header_id = $key->id;
                // transaction detail
                $transaction_detail = Transaction_detail::select(
                    'transaction_details.qty',
                    'products.product_name',
                )->join('products', 'products.id', '=', 'transaction_details.product_id')
                    ->where('transaction_details.transaction_header_id', $transaction_header_id)->get();

                    // create display product
                    $display_product_detail = '';
                    foreach($transaction_detail as $val2 => $key2) {
                        $display_product_detail .= $key2->product_name.' X '.$key2->qty.'<br />';
                    }

                $data[] = array(
                    'transaction' => $transaction_code,
                    'user' => $key->user,
                    'total' => $key->total,
                    'display_total' => 'Rp. ' . number_format($key->total),
                    'date' => $key->created_at,
                    'display_date' => date('d M Y', strtotime($key->created_at)),
                    'transaction_detail' => $transaction_detail,
                    'display_product_detail' => $display_product_detail,
                );
            }
        }

        $output = $data;

        return $output;
    }

    public function SetTransactionCode($document_code, $document_number)
    {
        $output = '';

        if (!empty($document_code) && !empty($document_number)) {
            $output = $document_code . ' - ' . $document_number;
        }

        return $output;
    }

    public function CreateTransactionCode()
    {
        $output = array();

        $document_number = $this->CreateDocumentNumber();

        $output = array(
            'document_code' => 'TRX',
            'document_number' => $document_number,
        );

        return $output;
    }

    public function CreateDocumentNumber()
    {
        $output = '';

        $document_number = '';

        $total_transaction = Transaction_header::count();
        $number = $total_transaction + 1;

        switch (strlen($number)) {
            case 1:
                $document_number = '00' . $number;
                break;
            case 2:
                $document_number = '0' . $number;
                break;
            default:
                $document_number = $number;
        }

        $output = $document_number;

        return $output;
    }

    public function GetTotal($data)
    {
        $output = 0;

        if (is_array($data)) {
            $subtotal = 0;
            $total = 0;
            foreach ($data as $val => $key) {
                if ($key['choose'] === true) {
                    $sales_price = $key['sales_price'];
                    $qty = $key['qty'];
                    $subtotal = $sales_price * $qty;
                    $total = $total + $subtotal;
                }
            }
            $output = $total;
        }

        return $output;
    }
}
