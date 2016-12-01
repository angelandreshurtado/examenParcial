<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model backend\models\Personas */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="personas-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'username')->textInput(['maxlength' => true, 'readonly' => true]) ?>

    <?= $form->field($model, 'cuenta')->textInput() ?>
  
    <div class="form-group"><br>
    <?= Html::submitButton($model->isNewRecord ? 'Crear' : 'Resetear Cuenta', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

<?php ActiveForm::end(); ?>

</div>
