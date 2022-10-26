<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('gateways', function (Blueprint $table) {
            $table->id();
            $table->string('name');
            $table->string('namespace')->nullable();

            $table->integer('charge')->default(0);
            $table->integer('min_amount')->default(100);
            $table->integer('max_amount')->default(1000);

            $table->boolean('is_auto')->default(0);
            $table->boolean('image_accept')->nullable();
            $table->boolean('phone_required')->default(0);
            $table->boolean('test_mode')->default(0);
            $table->boolean('is_active')->default(1);
            $table->text('data')->nullable();
            $table->foreignId('currency_id')->constrained();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('gateways');
    }
};
