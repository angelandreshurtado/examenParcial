<?php

namespace frontend\models;

use Yii;

/**
 * This is the model class for table "pedido".
 *
 * @property integer $id
 * @property integer $id_user
 * @property integer $id_pdt
 */
class Pedido extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'pedido';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['id_user', 'id_pdt'], 'required'],
            [['id_user', 'id_pdt'], 'integer'],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'id_user' => 'Id User',
            'id_pdt' => 'Id Pdt',
        ];
    }
}
