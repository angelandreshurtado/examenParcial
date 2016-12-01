<?php
/* @var $this yii\web\View */

use yii\helpers\Html;
use app\assets\AppAsset;
use yii\widgets\ActiveForm;

AppAsset::register($this);
$asset = app\assets\AppAsset::register($this);
$baseUrl = $asset->baseUrl;
?>
<div class="pedido-site" >

    <h1>Pedido</h1>

    <center><h2>Hola <?= $nombre ?>, escoja entre nuestra variedad de productos</h2><br></center>

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'id')->textInput(['type'=>"hidden",]) ?>

    <?= $form->field($model, 'id_user')->textInput(['type'=>"hidden",]) ?>

    <?= $form->field($model, 'cuenta')->textInput()->label(0.00) ?>

    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? 'Create' : 'Update', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>
    
</div>
