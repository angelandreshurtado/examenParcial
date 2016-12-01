<?php

namespace backend\models;

use Yii;

/**
 * This is the model class for table "departamentos".
 *
 * @property integer $id
 * @property string $nombre
 *
 * @property Personas[] $personas
 */
class Departamentos extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'departamentos';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['nombre'], 'required'],
            [['nombre'], 'string', 'max' => 30],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'nombre' => 'Nombre Departamento',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getPersonas()
    {
        return $this->hasMany(Personas::className(), ['id_dpt' => 'id']);
    }
}
