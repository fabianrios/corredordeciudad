controllers = angular.module('controllers',[])
controllers.controller("MdeController", [ '$scope', '$routeParams', '$location', '$resource', 'flash', 'Recipe', 'Upload'
  ($scope,$routeParams,$location, $resource, flash, Recipe, Upload)->
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
          
      # upload on file select or drop
      $scope.upload = (file, recipe) ->
        console.log file, recipe
        recipe.image = file
        Upload.upload(
          method: 'PUT'
          url: '/recipes/' + recipe.id + '.json'
          fields: recipe
          file: file).progress((evt) ->
          progressPercentage = parseInt(100.0 * evt.loaded / evt.total)
        ).success((data, status, headers, config) ->
          console.log data
        ).error (data, status, headers, config) ->
          console.log "error:", data

      $scope.save = ->
        onError = (_httpResponse)-> flash.error = "Something went wrong"
        if $scope.recipe.id
          $scope.recipe.$save(
            ( ()-> $location.path("/recipes/#{$scope.recipe.id}") ),
            onError)
          if $scope.file && !$scope.file.$error
            $scope.upload $scope.file, $scope.recipe
        else
          Recipe.create($scope.recipe,
            ( (newRecipe)->
              if $scope.file && !$scope.file.$error
                $scope.upload $scope.file, newRecipe
              $location.path("/recipes/#{newRecipe.id}") ),
            onError
          )

      $scope.delete = ->
        $scope.recipe.$delete()
        $scope.back()
        
])