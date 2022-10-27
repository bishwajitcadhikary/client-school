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
        Schema::create('plans', function (Blueprint $table) {
            $table->id();
            $table->string('name');
            $table->integer('monthly_price')->default(0);
            $table->integer('yearly_price')->default(0);
            $table->integer('school_limit')->default(1);
            $table->integer('max_limit')->default(0);
            $table->text('description')->nullable();
            $table->boolean('is_active')->default(1);
            $table->boolean('is_trial')->default(1);
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
        Schema::dropIfExists('plans');
    }
};
