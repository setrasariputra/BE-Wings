<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Product_image extends Model
{
    use HasFactory;
    use SoftDeletes;

    protected $dates = ['deleted_at'];

    public function getTableColumns()
    {
        return $this->getConnection()->getSchemaBuilder()->getColumnListing($this->getTable());
    }

    public function ProductImage($id)
    {
        $output = null;

        $image = Product_image::where('product_id',$id)->first();
        if(!empty($image)) {
            $image_url = env('APP_URL').'/'.$image['fileurl'].'/'.$image['filename'];
            $image_url = str_replace('./','',$image_url);
            $output = array(
                'filename' => $image['filename'],
                'filetype' => $image['filetype'],
                'filesize' => $image['filesize'],
                'fileurl' => $image['fileurl'],
                'image_url' => $image_url,
            );
        }

        return $output;
    }
}
