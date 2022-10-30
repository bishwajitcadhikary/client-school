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
        Schema::create('plan_orders', function (Blueprint $table) {
            $table->id();
            $table->foreignId('plan_id')->constrained()->cascadeOnDelete();
            $table->foreignId('customer_id')->constrained('users')->cascadeOnDelete();
            $table->foreignId('gateway_id')->nullable()->constrained('gateways')->nullOnDelete();
            $table->integer('amount')->default(0);
            $table->boolean('is_paid')->default(0);
            $table->string('trx_id')->nullable();
            $table->text('description')->nullable();
            $table->tinyInteger('status')->default(0)->comment('0: pending, 1: success, 2: failed');
            $table->enum('interval', ['monthly', 'yearly']);
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
        Schema::dropIfExists('plan_orders');
    }
};
