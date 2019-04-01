<?php
/**
 * @copyright ©2018 浙江禾匠信息科技
 * @author Lu Wei
 * @link http://www.zjhejiang.com/
 * Created by IntelliJ IDEA
 * Date Time: 2018/10/24 9:22
 */


namespace app\hejiang\task;


use app\hejiang\exceptions\TaskException;
use yii\base\Component;
use app\hejiang\cloud\CloudTask;

class Task extends Component
{
    /**
     * 创建定时任务
     * @param string $class 继承TaskRunnable的class
     * @param int $delay_seconds 任务执行延时，秒
     * @param array $params 任务附加参数
     * @return string 任务的token，\app\models\Task->token
     * @throws TaskException
     * @throws \yii\base\Exception
     * @throws \app\hejiang\cloud\CloudException
     */
    public function create($class, $delay_seconds, $params = [])
    {
        try {
            $task = new \app\models\Task();
            $task->class = $class;
            $task->delay_seconds = $delay_seconds;
            $task->params = \Yii::$app->serializer->encode($params);
            $task->addtime = time();
            $task->token = \Yii::$app->security->generateRandomString(64);
            $callUrl = \Yii::$app->urlManager->createUrl(['task/index', 'token' => $task->token]);
            $res = CloudTask::create($callUrl, $delay_seconds);
            if ($res['code'] === 0) {
                $task->save();
                return $task->token;
            }
            throw new TaskException($res['msg']);
        } catch (\Exception $e) {
            \Yii::warning($e->getMessage());
        }
    }

    public function run($token)
    {
        $task = \app\models\Task::findOne([
            'is_delete' => 0,
            'is_executed' => 0,
            'token' => $token,
        ]);
        if (!$task) {
            return;
        }
        /** @var TaskRunnable $class */
        $class = new $task->class();
        $res = $class->run(\Yii::$app->serializer->decode($task->params));
        if ($res) {
            $task->is_executed = 1;
            $task->save();
        } else {
            throw new TaskException('任务没有执行，或返回结果不为真。');
        }
    }
}
