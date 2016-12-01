<?php

namespace backend\models;

use Yii;

/**
 * This is the model class for table "productos".
 *
 * @property integer $id
 * @property string $nombre
 * @property double $precio
 */
class Productos extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'productos';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['nombre'], 'required'],
            [['precio'], 'number'],
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
            'nombre' => 'Producto',
            'precio' => 'Precio',
        ];
    }
}
