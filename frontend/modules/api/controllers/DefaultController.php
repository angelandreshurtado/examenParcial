<?php

namespace frontend\modules\api\controllers;

use \yii\rest\ActiveController;
use yii\data\ActiveDataProvider;

/**
 * Default controller for the `api` module
 */
class DefaultController extends ActiveController {

    public $modelClass = 'frontend\models\Pedido';

    public function actions() {
        return array_merge(
                parent::actions(), [
            'index' => [
                'class' => 'yii\rest\IndexAction',
                'modelClass' => $this->modelClass,
                'checkAccess' => [$this, 'checkAccess'],
                'prepareDataProvider' => function ($action) {
                    /* @var $model Post */
                    $model = new $this->modelClass;
                    $query = $model::find();
                    $dataProvider = new ActiveDataProvider(['query' => $query]);
                    $model->setAttribute('id', @$_GET['id']);
                    $model->setAttribute('id_user', @$_GET['id_user']);
                    $model->setAttribute('id_pdt', @$_GET['id_pdt']);
                    $model->setAttribute('username', @$_GET['username']);
                    
                    $query->andFilterWhere(['like', 'id', $model->id]);
                    $query->andFilterWhere(['like', 'id_user', $model->id_user]);
                    $query->andFilterWhere(['like', 'id_pdt', $model->id_pdt]);
                    $query->andFilterWhere(['like', 'username', $model->username]);
                    return $dataProvider;
                }
            ]
                ]
        );
    }

}
