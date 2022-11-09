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
        Schema::create('database_upgrades', function (Blueprint $table) {
            $table->id();
            $table->string('version')->nullable();
            $table->string('database')->nullable();
            $table->text('change_log')->nullable();
            $table->string('status')->nullable()->comment('pending, running, success, failed');
            $table->json('success')->nullable();
            $table->json('failed')->nullable();
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
        Schema::dropIfExists('database_upgrades');
    }
};
