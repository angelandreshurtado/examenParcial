<?php

namespace backend\models;

use Yii;

/**
 * This is the model class for table "personas".
 *
 * @property integer $id
 * @property integer $id_user
 * @property string $username
 * @property double $cuenta
 * @property integer $id_dpt
 */
class Personas extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'personas';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['id_user', 'username', 'id_dpt'], 'required'],
            [['id_user', 'id_dpt'], 'integer'],
            [['cuenta'], 'number'],
            [['username'], 'string', 'max' => 30],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'id_user' => 'Id Usuario',
            'username' => 'Username',
            'cuenta' => 'Cuenta',
            'id_dpt' => 'Id Departamento',
        ];
    }
}
