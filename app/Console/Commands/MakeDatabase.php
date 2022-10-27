<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use Symfony\Component\Console\Input\InputArgument;

class MakeDatabase extends Command
{
    protected $signature = 'make:database {name}';

    protected $description = 'Command description';

    public function handle()
    {
        \DB::connection()->statement('CREATE DATABASE :schema', ['schema' => 'asdf']);
    }

    protected function getArguments()
    {
        return [
            ['name', InputArgument::REQUIRED, 'The name of the database'],
        ];
    }
}
