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
      
      $scope.newRecipe = -> $location.path("/recipes/new")
      $scope.edit = (recipeId)-> $location.path("/recipes/#{recipeId}/edit")
      
      $scope.back = -> $location.path("/")
      $scope.cancel = ->
        if $scope.recipe.id
          $location.path("/recipes/#{$scope.recipe.id}")
        else
          $location.path("/")

      $scope.save = ->
        onError = (_httpResponse)-> flash.error = "Something went wrong"
        if $scope.recipe.id
          $scope.recipe.$save(
            ( ()-> $location.path("/recipes/#{$scope.recipe.id}") ),
            onError)
        else
          Recipe.create($scope.recipe,
            ( (newRecipe)-> $location.path("/recipes/#{newRecipe.id}") ),
            onError
          )

      $scope.delete = ->
        $scope.recipe.$delete()
        $scope.back()
        
])