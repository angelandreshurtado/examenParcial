<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model frontend\models\Pedido */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="pedido-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'id_user')->textInput(['type' => 'hidden', 'value' => Yii::$app->user->identity->id])->label("<h3>Hola " . Yii::$app->user->identity->username . "</h3>") ?>
    <?= $form->field($model, 'id_pdt')->dropDownList(\yii\helpers\ArrayHelper::map(backend\models\Productos::find()->all(), 'id', 'nombre'))->label("Escoje uno de nuestros productos") ?>

    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? 'Comprar Producto' : 'Actualizar', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
