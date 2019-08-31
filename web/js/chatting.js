var app = angular.module('app', []);
app.controller('myController', function ($scope) {
    $scope.sendMess = function () {
        var text = "<p>" + $scope.txtName + ": " + $scope.txtMess + "</p>";
        $("#content").append(text);
    };
});


