<?php
/**
 * @copyright ©2018 Lu Wei
 * @author Lu Wei
 * @link http://www.luweiss.com/
 * Created by IntelliJ IDEA
 * Date Time: 2018/10/23 11:53
 */


namespace app\hejiang\cloud;


class Cloud
{
    public static function getHostInfo()
    {
        $cacheKey = 'SITE_CLOUD_HOST_INFO';
        $res = \Yii::$app->cache->get($cacheKey);
        if ($res) {
            return $res;
        }
        $res = HttpClient::get(CloudApi::SITE_INFO);
        $res = json_decode($res, true);
        if ($res['code'] === 0) {
            \Yii::$app->cache->set($cacheKey, $res, 600);
        }
        return $res;
    }


    /**
     * 获取当前站点域名
     * @return mixed
     * @throws CloudException
     */
    public static function getCurrentDomain()
    {
        if (isset($_SERVER['HTTP_HOST'])) {
            return $_SERVER['HTTP_HOST'];
        } elseif (isset($_SERVER['SERVER_NAME'])) {
            return $_SERVER['SERVER_NAME'];
        }
        throw new CloudException('无法获取当前域名。');
    }

    public static function getRequestInfo()
    {
        try {
            $version = hj_core_version();
        } catch (\Exception $e) {
            $version = '0.0.0';
        }
        return base64_encode(json_encode([
            'domain' => \Yii::$app->request->hostName,
            'url' => \Yii::$app->request->absoluteUrl,
            'path' => \Yii::$app->basePath,
            'version' => $version,
        ], JSON_UNESCAPED_UNICODE));
    }
}