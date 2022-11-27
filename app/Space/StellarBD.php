<?php

namespace App\Space;

use App\Models\FPDevice;

class StellarBD
{
    private $url = 'https://rumytechnologies.com/rams/json_api';
    private $auth_code = "lki8ml13yboxx34gq29i72hnhgku3c";
    private $auth_user = "edusofto";

    public function curl($data)
    {
        $data = json_encode($data);
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, $this->url);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
        curl_setopt($ch, CURLINFO_HEADER_OUT, 1);
        curl_setopt($ch, CURLOPT_POST, 1);
        curl_setopt($ch, CURLOPT_POSTFIELDS, $data);
        curl_setopt($ch, CURLOPT_HTTPHEADER, [
            'Content-Type: application/json',
            'Content-Length: ' . strlen($data),
            'Accept: application/json',
        ]);
        $output = curl_exec($ch);
        curl_close($ch);
        return $output;
    }

    public function getLog($startDate, $endDate, $startTime, $endTime)
    {
        $data = [
            "operation" => "fetch_log",
            "auth_user" => $this->auth_user,
            "auth_code" => $this->auth_code,
            "start_date" => $startDate,
            "end_date" => $endDate,
            "start_time" => $startTime,
            "end_time" => $endTime
        ];

        return json_decode($this->curl($data));
    }

    public function getUnsentLog()
    {
        $data = [
            "operation" => "fetch_unsent_log",
            "auth_code" => $this->auth_code,
        ];

        return json_decode($this->curl($data));
    }

    public function getGpsLog($startDate, $endDate, $startTime, $endTime, $accessId)
    {
        $data = [
            "operation" => "fetch_gps_log",
            "auth_user" => $this->auth_user,
            "auth_code" => $this->auth_code,
            "start_date" => $startDate,
            "end_date" => $endDate,
            "start_time" => $startTime,
            "end_time" => $endTime,
            "access_id" => $accessId
        ];

        return $this->curl($data);
    }

    public function getDeviceInfo()
    {
        $data = [
            "operation" => "fetch_device_detail",
            "auth_user" => $this->auth_user,
            "auth_code" => $this->auth_code
        ];

        $devices = json_decode($this->curl($data), true);

        foreach ($devices as $index => $device) {
            FPDevice::updateOrCreate([
                'device_id' => $device['device_id']
            ], [
                'name' => $device['device_name'],
                'last_connected' => $device['last_connected']
            ]);
        }

        return FPDevice::all();
    }

    public function setDeviceUserRegistrationMode($deviceId)
    {
        $data = [
            "operation" => "set_user_registration_mode",
            "auth_user" => $this->auth_user,
            "auth_code" => $this->auth_code,
            "device_id" => $deviceId
        ];

        return $this->curl($data);
    }

    public function getUserList()
    {
        $data = [
            "operation" => "fetch_user_list",
            "auth_user" => $this->auth_user,
            "auth_code" => $this->auth_code
        ];

        return $this->curl($data);
    }

    public function deleteUserPermanently($userId)
    {
        $data = [
            "operation" => "delete_permanently",
            "auth_user" => $this->auth_user,
            "auth_code" => $this->auth_code,
            "username" => $userId
        ];

        return $this->curl($data);
    }

    /**
     * Delete user from device
     * @param $userId
     * @param $deviceId
     * @return null|string
     */
    public function removeUserFromDevice($userId, $deviceId)
    {
        $data = [
            'operation' => 'remove_user_from_device',
            "auth_user" => $this->auth_user,
            "auth_code" => $this->auth_code,
            "username" => $userId,
            "device_id" => $deviceId
        ];

        return $this->curl($data);
    }
}
