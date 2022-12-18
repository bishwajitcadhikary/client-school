<?php

namespace App\Space;

use App\Models\FPDevice;

class StellarBD
{
    private $url = 'https://rumytechnologies.com/rams/json_api';
    private $auth_code = "lki8ml13yboxx34gq29i72hnhgku3c";
    private $auth_user = "edusofto";

    public function __construct($auth_code, $auth_user)
    {
        $this->auth_code = $auth_code;
        $this->auth_user = $auth_user;
    }

    /**
     * Post data to StellarBD
     * @param $data
     * @return bool|string|null
     */
    public function curl($data): bool|string|null
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

    /**
     * Get attendance log from StellarBD
     * @param string|null $startDate
     * @param string|null $endDate
     * @param string|null $startTime
     * @param string|null $endTime
     * @return array
     */
    public function getLog(string $startDate = null, string $endDate = null, string $startTime = null, string $endTime = null): array
    {
        $startDate = $startDate ?? today()->addDays(60)->format('Y-m-d');
        $endDate = $endDate ?? now()->format('Y-m-d');
        $startTime = $startTime ?? '00:00:00';
        $endTime = $endTime ?? '23:59:59';

        $data = [
            "operation" => "fetch_log",
            "auth_user" => $this->auth_user,
            "auth_code" => $this->auth_code,
            "start_date" => $startDate,
            "end_date" => $endDate,
            "start_time" => $startTime,
            "end_time" => $endTime
        ];

        $log = json_decode($this->curl($data), true)['log'] ?? [];

        if (count($log) > 0) {
            return [
                'status' => true,
                'message' => 'Log fetched successfully',
                'data' => array_values($log)
            ];
        }
        return [
            'status' => false,
            'message' => 'No log found',
            'data' => null,
        ];
    }

    /**
     * Get log from specific device
     * @param string $deviceId
     * @param string|null $startDate
     * @param string|null $endDate
     * @param string|null $startTime
     * @param string|null $endTime
     * @return array
     */
    public function getLogFromDevice(string $deviceId, string $startDate = null, string $endDate = null, string $startTime = null, string $endTime = null): array
    {
        $startDate = $startDate ?? now()->subDay()->format('Y-m-d');
        $endDate = $endDate ?? now()->format('Y-m-d');
        $startTime = $startTime ?? now()->subDay()->format('H:i:s');
        $endTime = $endTime ?? now()->format('H:i:s');

        $log = $this->getLog($startDate, $endDate, $startTime, $endTime);

        if ($log['status']) {
            $log = $log['data'];
            $log = array_filter($log, function ($item) use ($deviceId) {
                return $item['unit_id'] == $deviceId;
            });
            return [
                'status' => true,
                'message' => 'Log fetched successfully',
                'data' => array_values($log)
            ];
        }

        return [
            'status' => false,
            'message' => 'No log found',
            'data' => null,
        ];
    }

    /**
     * Get log from specific user
     * @param string $username
     * @param string|null $deviceId
     * @param string|null $startDate
     * @param string|null $endDate
     * @param string|null $startTime
     * @param string|null $endTime
     * @return array
     */
    public function getSpecifUserLog(string $username, string $deviceId = null, string $startDate = null, string $endDate = null, string $startTime = null, string $endTime = null): mixed
    {
        $startDate = $startDate ?? now()->subDay()->format('Y-m-d');
        $endDate = $endDate ?? now()->format('Y-m-d');
        $startTime = $startTime ?? now()->subDay()->format('H:i:s');
        $endTime = $endTime ?? now()->format('H:i:s');

        if ($deviceId) {
            $log = $this->getLogFromDevice($deviceId, $startDate, $endDate, $startTime, $endTime);
        } else {
            $log = $this->getLog($startDate, $endDate, $startTime, $endTime);
        }

        if ($log['status']) {
            $log = $log['data'];
            $log = array_filter($log, function ($item) use ($username) {
                return $item['user_name'] == $username;
            });
            return [
                'status' => true,
                'message' => 'Log fetched successfully',
                'data' => array_values($log)
            ];
        }

        return [
            'status' => false,
            'message' => 'No log found',
            'data' => null,
        ];
    }

    /**
     * Get unsent log
     * @return array
     */
    public function getUnsentLog(): array
    {
        $data = [
            "operation" => "fetch_unsent_log",
            "auth_code" => $this->auth_code,
        ];

        $data = json_decode($this->curl($data), true);

        if (isset($data['log']) && count($data['log']) > 0) {
            return [
                'status' => true,
                'message' => 'Log fetched successfully',
                'data' => $data['log']
            ];
        }

        return [
            'status' => false,
            'message' => 'No log found',
            'data' => null,
        ];
    }

    /**
     * @param $accessId
     * @param $startDate
     * @param $endDate
     * @param $startTime
     * @param $endTime
     * @return mixed
     */
    public function getGpsLog($accessId, $startDate = null, $endDate = null, $startTime = null, $endTime = null): mixed
    {
        $startDate = $startDate ?? now()->subDay()->format('Y-m-d');
        $endDate = $endDate ?? now()->format('Y-m-d');
        $startTime = $startTime ?? now()->subDay()->format('H:i:s');
        $endTime = $endTime ?? now()->format('H:i:s');

        $data = [
            "operation" => "fetch_gps_log",
            "auth_user" => $this->auth_user,
            "auth_code" => $this->auth_code,
            "access_id" => $accessId,
            "start_date" => $startDate,
            "end_date" => $endDate,
            "start_time" => $startTime,
            "end_time" => $endTime,
        ];

        return $this->curl($data);
    }

    /**
     * Get all device from StellarBD
     * @return array
     */
    public function getDeviceInfo(): array
    {
        $data = [
            "operation" => "fetch_device_detail",
            "auth_user" => $this->auth_user,
            "auth_code" => $this->auth_code
        ];

        $data = json_decode($this->curl($data), true) ?? [];

        if (count($data) > 0){
            return [
                'status' => true,
                'message' => 'Device fetched successfully',
                'data' => $data,
            ];
        }

        return [
            'status' => false,
            'message' => 'No device found',
            'data' => null,
        ];
    }

    /**
     * Check device status
     * @param $deviceId
     * @return bool
     */
    public function checkDevice($deviceId)
    {
         $devices = $this->getDeviceInfo();

        if ($devices['status']) {
            $devices = $devices['data'];
            return in_array($deviceId, array_column($devices, 'device_id'));
        }

        return false;
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

    /**
     * Get all user from StellarBD
     * @return array
     */
    public function getUserList()
    {
        $data = [
            "operation" => "fetch_user_list",
            "auth_user" => $this->auth_user,
            "auth_code" => $this->auth_code
        ];

        $data = json_decode($this->curl($data), true);

        if (isset($data['user_list']) && count($data['user_list']) > 0){
            return [
                'status' => true,
                'message' => 'User fetched successfully',
                'data' => $data['user_list'],
            ];
        }

        return [
            'status' => false,
            'message' => 'No user found',
            'data' => null,
        ];
    }

    /**
     * @return array
     */
    public function getDeviceUser()
    {
        $data = [
            "operation" => "fetch_user_in_device_list",
            "auth_user" => $this->auth_user,
            "auth_code" => $this->auth_code,
        ];

        $data = json_decode($this->curl($data), true);

        if (isset($data['device_user']) && count($data['device_user']) > 0){
            return [
                'status' => true,
                'message' => 'Device users fetched successfully',
                'data' => $data['device_user'],
            ];
        }

        return [
            'status' => false,
            'message' => 'No user found',
            'data' => null,
        ];
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
