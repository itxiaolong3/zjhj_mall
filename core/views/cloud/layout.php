<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=Edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=0">
    <title><?= $this->title ?></title>
    <link rel="stylesheet" href="https://unpkg.com/element-ui/lib/theme-chalk/index.css">
    <style>
    body {
        margin: 0;
        font-size: 14px;
        background: #f6f6f6;
    }

    a {
        color: #409EFF;
    }
    </style>
    <script src="https://unpkg.com/vue@2.5.17/dist/vue.js"></script>
    <script src="https://unpkg.com/element-ui/lib/index.js"></script>
    <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
    <script>
    const _csrfToken = '<?=Yii::$app->request->csrfToken?>';

    function cleanArray(actual) {
        const newArray = [];
        for (let i = 0; i < actual.length; i++) {
            if (actual[i]) {
                newArray.push(actual[i]);
            }
        }
        return newArray;
    }

    // 将一个对象转成QueryString
    function toQueryString(obj) {
        if (!obj) return "";
        return cleanArray(
            Object.keys(obj).map(key => {
                if (obj[key] === undefined) return "";
                return encodeURIComponent(key) + "=" + encodeURIComponent(obj[key]);
            })
        ).join("&");
    }

    const client = axios.create({
        headers: {
            'Content-Type': 'application/x-www-form-urlencoded'
        }
    });
    client.interceptors.request.use(function (config) {
        if (config.method.toLowerCase() === 'post') {
            config.data['_csrf'] = _csrfToken;
        }
        if (config.headers['Content-Type'] !== 'text/plain' && config.headers['Content-Type'] !== 'application/json') {
            config.data = toQueryString(config.data)
        }
        return config;
    }, function (error) {
        return Promise.reject(error);
    });
    </script>
</head>
<body>
<?= $content ?>
</body>
</html>