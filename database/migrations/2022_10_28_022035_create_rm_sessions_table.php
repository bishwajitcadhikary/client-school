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
        DB::statement('CREATE TABLE `rm_sessions` ( `id` varchar(40) NOT NULL, `ip_address` varchar(45) NOT NULL, `timestamp` int UNSIGNED NOT NULL DEFAULT 0, `data` blob NOT NULL )');
        DB::statement('ALTER TABLE `rm_sessions` ADD PRIMARY KEY (`id`), ADD KEY `ci_sessions_timestamp` (`timestamp`)');
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('rm_sessions');
    }
};
