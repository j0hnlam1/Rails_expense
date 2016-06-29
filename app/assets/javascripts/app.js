var app = angular.module('expApp', ['ngRoute']);
app.config(function($routeProvider, $httpProvider) {
    $routeProvider
        .when("/show", {
            templateUrl: "/partials/show.html.erb",
            controller: "billsController"
        })
        .when("/add", {
            templateUrl: "/partials/add.html.erb",
            controller: "billsController"
        })
        .when("/edit",{
            templateUrl: "/partials/edit.html.erb",
            controller: "billsController"
        })
    // we are using jquery to get the value of the token and setting in as a default header
    $httpProvider.defaults.headers.common['X-CSRF-Token'] = $('meta[name=csrf-token]').attr('content');
});

app.factory("billFactory", function($http){
    var factory = {};
    factory.index = function(callback){
        $http.get("/bills").success(function(output){
            callback(output);
    })
 }
    // create function that makes a post request to the '/bills' route
    // notice that we have a callback that passes the information that we get back from the rails billsController to the angular billsController
    factory.create = function(billInfo, callback){
        $http.post("/bills", billInfo).success(function(output){
            callback(output);
        })
    }

    factory.update = function(callback){
        $http.patch('/bills').then(function(output){
            callback(output);
        })
    }

    factory.delete = function(id, callback){
        $http.delete("/bills/"+id).success(function(output){
            callback(output);
        })
    }
    return factory;
})

app.controller("billsController", function($scope, billFactory){
    billFactory.index(function(json){
        $scope.bills = json;
    })
    // calling the create method from our factory when the button is cliked and updating the $scope.bills information with the json data that we get back from the rails billsController
    $scope.createBill = function(){
        billFactory.create($scope.newBill, function(json){
            $scope.bills = json;
            $scope.newBill = {};
        });
    }

    $scope.editBill = function(){
        billFactory.update(function(json){
            $scope.bills = json;    
        })
    }

    $scope.deleteBill = function(billId){
        billFactory.delete(billId, function(json){
            $scope.bills = json;
        })
    }
})
