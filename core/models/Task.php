<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "{{%task}}".
 *
 * @property string $id
 * @property string $token
 * @property integer $delay_seconds
 * @property integer $is_executed
 * @property string $class
 * @property string $params
 * @property integer $addtime
 * @property integer $is_delete
 */
class Task extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%task}}';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['token', 'delay_seconds', 'class'], 'required'],
            [['delay_seconds', 'is_executed', 'addtime', 'is_delete'], 'integer'],
            [['params'], 'string'],
            [['token'], 'string', 'max' => 128],
            [['class'], 'string', 'max' => 255],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'token' => 'Token',
            'delay_seconds' => '多少秒后执行',
            'is_executed' => '是否已执行：0=未执行，1=已执行',
            'class' => 'Class',
            'params' => 'Params',
            'addtime' => 'Addtime',
            'is_delete' => 'Is Delete',
        ];
    }
}
