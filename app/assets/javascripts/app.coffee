mde15 = angular.module('mde15',[
  'templates',
  'ngRoute',
  'ngResource',
  'controllers',
  'angular-flash.service',
  'angular-flash.flash-alert-directive'
])

mde15.config([ '$routeProvider', 'flashProvider'
  ($routeProvider,flashProvider)->
    
    flashProvider.errorClassnames.push("alert-danger")
    flashProvider.warnClassnames.push("alert-warning")
    flashProvider.infoClassnames.push("alert-info")
    flashProvider.successClassnames.push("alert-success")
    
    $routeProvider
      .when('/',
        templateUrl: "index.html"
        controller: 'MdeController'
      ).when('/recipes/new',
        templateUrl: "form.html"
        controller: 'RecipeController'
      ).when('/recipes/:recipeId',
        templateUrl: "show.html"
        controller: 'RecipeController'
      ).when('/recipes/:recipeId/edit',
        templateUrl: "form.html"
        controller: 'RecipeController'
      )
])

