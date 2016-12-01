// Creación del módulo
var angularRoutingApp = angular.module('angularRoutingApp', ['ngRoute']);
// Configuración de las rutas
angularRoutingApp.config(function ($routeProvider) {
    $routeProvider
            .when('/', {
                templateUrl: 'pages/home.html',
                controller: 'mainController'
            })
            .when('/rest', {
                templateUrl: 'pages/rest.html',
                controller: 'restController'
            })
            .otherwise({
                redirectTo: '/'
            });
});


angularRoutingApp.controller('mainController', function ($scope) {
    $scope.introduccion = 'Un servicio es un componente de software que se suministran datos a traves de un extremo accesibles a través de la red, pueden utilizarse utilizado desde un servidor remoto a través de Internet. Se puede definir SOAP como el método de intercambio de mensajes basado en XML a través de Internet para proporcionar y consumir servicios web. Soap define un nivel superior de elemento XML denominado envelope, que contiene un encabezado y un cuerpo (WSDL) es un XML para definir interfaces sintácticamente. A pesar de su complejidad, el formato del mensaje SOAP y WSDL Interface han ganado la adopción generalizada de tecnologías como la pasarela capaz de ofrecer interoperabilidad erability- entre sistemas middleware heterogéneos Una de las ventajas del protocolo WS es la transparencia REST básicamente significa que cada URL única es una representación de un objeto. Las principales ventajas de los servicios web REST son: Ligero no tiene un montón de marcas XML adicional, Resultados legible por humanos Fácil de construir si se utilizan herramientas necesarias Las de Soap son, Fácil de consumir y muy Rígido';
});


angularRoutingApp.controller('restController', function ($scope) {
    $scope.message = 'Esta es la pagina ingreso';

});

function buscar_rest() {
    var valor = 'id=' + $('#id').val();


    $.ajax({
        url: "http://localhost/examenParcial/frontend/web/api/default?" + valor,
        success:
                function (data) {
                    console.log(data);
                    $('.alert-success').show();
                },
        error: function () {
            $('.alert-danger').show();
        },
        statusCode: {
            404: function () {
                $('.alert-danger').show();
            }
        }
    }).then(function (data) {
        $('#id').val(data.id);
        $('#id_user').val(data.id_user);
        $('#username').val(data.username);
        $('#id_pdt').val(data.id_pdt);
    });
}
