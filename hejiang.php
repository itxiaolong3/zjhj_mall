<?php
defined('IN_IA') or exit('Access Denied');

function hj_tableprefix()
{
    return 'hjmall_';
}

function hj_tablename($table)
{
    return '`hjmall_' . $table . '`';
}

function hj_pdo_tableexists($tablename)
{
    if (empty($tablename))
        return false;
    $sql = "SHOW TABLES LIKE '" . hj_tableprefix() . $tablename . "'";
    $data = pdo_fetch($sql, array());
    if (!empty($data)) {
        $data = array_values($data);
        if (in_array(hj_tableprefix() . $tablename, $data)) {
            return true;
        } else {
            return false;
        }
    } else {
        return false;
    }
}

function hj_pdo_fieldexists($tablename, $fieldname = '')
{
    if (!hj_pdo_tableexists($tablename))
        return false;
    $sql = "DESCRIBE " . hj_tablename($tablename) . " `{$fieldname}`";
    $isexists = pdo_fetch($sql, array());
    return !empty($isexists) ? true : false;
}

function hj_core_version()
{
    $file = __DIR__ . '/core/version.json';
    if (file_exists($file)) {
        $res = json_decode(file_get_contents($file), true);
        return $res ? (isset($res['version']) ? $res['version'] : null) : null;
    }
    return null;
}

function hj_pdo_run($sql)
{
    try {
        pdo_query($sql);
        return true;
    } catch (Exception $e) {
        return false;
    }
}