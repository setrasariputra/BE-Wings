<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Product extends Model
{
    use HasFactory;
    use SoftDeletes;

    protected $dates = ['deleted_at'];

    public function getTableColumns()
    {
        return $this->getConnection()->getSchemaBuilder()->getColumnListing($this->getTable());
    }

    public function Read()
    {
        $output = array();

        $products = Product::select('id','product_code','product_name','dimension','unit','currency','price','discount')->orderBy('product_name', 'ASC')->get();
        if(!empty($products)) {
            foreach($products as $val => $key) {
                $sales_price = $this->SalesPrice($key->price, $key->discount);
                $output[] = array(
                    'id' => $key->id,
                    'product_code' => $key->product_code,
                    'product_name' => $key->product_name,
                    'dimension' => $key->dimension,
                    'unit' => $key->unit,
                    'currency' => $key->currency,
                    'price' => $key->price,
                    'display_price' => 'Rp. '.number_format($key->price),
                    'discount' => $key->discount,
                    'sales_price' => $sales_price,
                    'display_sales_price' => 'Rp. '.number_format($sales_price),
                );
            }
        }

        return $output;
    }

    public function SalesPrice($price, $discount)
    {
        $output = 0;
        $sale_price = 0;

        if(!empty($price) && !empty($discount)) {
            $sales_price = $price - (($discount/100) * $price);
        }

        if(!empty($price) && empty($discount)) {
            $sales_price = $price;
        }

        $output = $sales_price;

        return $output;
    }
}
