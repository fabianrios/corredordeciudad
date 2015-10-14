controllers = angular.module('controllers',[])
controllers.controller("MdeController", [ '$scope', '$routeParams', '$location', '$resource', 'flash', 'Recipe'
  ($scope,$routeParams,$location, $resource, flash, Recipe)->
      $scope.search = (keywords)->  $location.path("/").search('keywords',keywords)
      
      Recipe.get({recipeId: $routeParams.recipeId},
        ( (recipe)-> $scope.recipe = recipe ),
        ( (httpResponse)->
          $scope.recipe = null
          flash.error   = "There is no recipe with ID #{$routeParams.recipeId}"
        )
      )
      
      if $routeParams.keywords
        Recipe.query(keywords: $routeParams.keywords, (results)-> $scope.recipes = results)
      else
        $scope.recipes = []
        
      $scope.view = (recipeId)-> $location.path("/recipes/#{recipeId}")
      $scope.back = -> $location.path("/")
])