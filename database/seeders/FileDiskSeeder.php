<?php

namespace Database\Seeders;

use App\Models\FileDisk;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class FileDiskSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $file_disks = array(
            array('id' => '3','name' => 'local_private','type' => 'REMOTE','driver' => 'local','set_as_default' => '1','credentials' => '{"aws_key": null, "aws_root": null, "aws_bucket": null, "aws_region": null, "aws_secret": null, "local_root": "/home/bishwajit/wovosoft/payment/storage/app"}','created_at' => '2022-10-21 17:01:13','updated_at' => '2022-10-21 17:01:52'),
            array('id' => '4','name' => 'local_public','type' => 'REMOTE','driver' => 'local','set_as_default' => '0','credentials' => '{"aws_key": null, "aws_root": null, "aws_bucket": null, "aws_region": null, "aws_secret": null, "local_root": "/home/bishwajit/wovosoft/payment/storage/app/public"}','created_at' => '2022-10-21 17:01:45','updated_at' => '2022-10-21 17:01:45')
        );

        FileDisk::insert($file_disks);
    }
}
