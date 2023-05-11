<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateTransactionDetailsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('transaction_details', function (Blueprint $table) {
            $table->id();
            $table->bigInteger('transaction_header_id')->unsigned();
            $table->bigInteger('product_id')->unsigned();
            $table->integer('price')->digits(6);
            $table->integer('qty')->digits(6);
            $table->string('unit', 5);
            $table->integer('subtotal')->digits(10);
            $table->string('currency', 5);
            $table->timestamps();
            $table->softDeletes();

            $table->foreign('transaction_header_id')->references('id')->on('transaction_headers');
            $table->foreign('product_id')->references('id')->on('products');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('transaction_details');
    }
}
