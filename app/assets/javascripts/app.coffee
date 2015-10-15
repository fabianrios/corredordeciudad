mde15 = angular.module('mde15',[
  'templates',
  'ngRoute',
  'ngResource',
  'controllers',
  'angular-flash.service',
  'angular-flash.flash-alert-directive',
  'ngFileUpload'
])

mde15.config([ '$routeProvider', 'flashProvider',
  ($routeProvider,flashProvider)->
    
    flashProvider.errorClassnames.push("alert")
    flashProvider.warnClassnames.push("warning")
    flashProvider.infoClassnames.push("info")
    flashProvider.successClassnames.push("success")
    
    $routeProvider
      .when('/',
        templateUrl: "index.html"
        controller: 'MdeController'
      ).when('/recipes/new',
        templateUrl: "form.html"
        controller: 'MdeController'
      ).when('/recipes/:recipeId',
        templateUrl: "show.html"
        controller: 'MdeController'
      ).when('/recipes/:recipeId/edit',
        templateUrl: "form.html"
        controller: 'MdeController'
      )
])


mde15.factory 'Recipe', [
  '$resource'
  ($resource) ->
    url = '/recipes/:recipeId'
    $resource url, {
      recipeId: '@id'
      format: 'json'
    },
      'create': method: 'POST'
      'index':
        method: 'GET'
        isArray: false
      'show':
        method: 'GET'
        isArray: true
      'update':
        method: 'PUT'
        params: id: '@id'
      'save':
        method: 'PUT'
        params: id: '@id'
]