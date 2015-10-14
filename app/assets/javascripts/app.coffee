mde15 = angular.module('mde15',[
  'templates',
  'ngRoute',
  'controllers',
])

mde15.config([ '$routeProvider',
  ($routeProvider)->
    $routeProvider
      .when('/',
        templateUrl: "index.html"
        controller: 'MdeController'
      )
])

recipes = [
  {
    id: 1
    name: 'Baked Potato w/ Cheese'
  },
  {
    id: 2
    name: 'Garlic Mashed Potatoes',
  },
  {
    id: 3
    name: 'Potatoes Au Gratin',
  },
  {
    id: 4
    name: 'Baked Brussel Sprouts',
  },
]

controllers = angular.module('controllers',[])
controllers.controller("MdeController", [ '$scope', '$routeParams', '$location',
  ($scope,$routeParams,$location)->
      $scope.search = (keywords)->  $location.path("/").search('keywords',keywords)
      if $routeParams.keywords
        keywords = $routeParams.keywords.toLowerCase()
        $scope.recipes = recipes.filter (recipe)-> recipe.name.toLowerCase().indexOf(keywords) != -1
      else
        $scope.recipes = []
])