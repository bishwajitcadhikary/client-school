<?php

namespace App\Space;

use App\Models\School;
use Illuminate\Support\Facades\Config;
use Illuminate\Support\Facades\Date;

class Wovo
{
    /**
     * @param $date
     * @param  string  $format
     * @return string|null
     */
    public static function formatDate($date, string $format = 'd M, Y'): string|null
    {
        return $date ? Date::parse($date)->format($format) : null;
    }

    /**
     * Set Environment Value Permanently
     *
     * @param  array  $values
     * @return bool
     */
    public static function setEnvironmentValue(array $values)
    {
        $envFile = app()->environmentFilePath();
        $str = file_get_contents($envFile);

        if (count($values) > 0) {
            foreach ($values as $envKey => $envValue) {
                $str .= "\n"; // In case the searched variable is in the last line without \n
                $keyPosition = strpos($str, "{$envKey}=");
                $endOfLinePosition = strpos($str, "\n", $keyPosition);
                $oldLine = substr($str, $keyPosition, $endOfLinePosition - $keyPosition);

                // If key does not exist, add it
                if (! $keyPosition || ! $endOfLinePosition || ! $oldLine) {
                    $str .= "{$envKey}={$envValue}\n";
                } else {
                    $str = str_replace($oldLine, "{$envKey}={$envValue}", $str);
                }
            }
        }

        $str = substr($str, 0, -1);
        if (! file_put_contents($envFile, $str)) {
            return false;
        }

        return true;
    }

    public static function setDatabaseConnection(School $school)
    {
        Config::set([
            'database.connections.school.host' => $school->host,
            'database.connections.school.port' => $school->port,
            'database.connections.school.database' => $school->database,
            'database.connections.school.username' => $school->username,
            'database.connections.school.password' => $school->password,
        ]);

        try {
            \DB::connection('school')->getPdo();
        } catch (\Exception $e) {
            throw new \Exception("Could not connect to the database.  Please check your configuration. error:" . $e->getMessage());
        }
    }
}
