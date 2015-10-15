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
        Upload.upload(
          method: 'PUT'
          url: '/recipes/' + recipe.id + '.json'
          fields: recipe
          file: file).progress((evt) ->
          progressPercentage = parseInt(100.0 * evt.loaded / evt.total)
        ).success((data, status, headers, config) ->
          console.log "success", data
          $location.path("/recipes/#{data.id}") 
        ).error (data, status, headers, config) ->
          console.log "error:", data
      
      $scope.upload_new = (file, recipe) ->    
        Upload.upload(
          method: 'POST'
          url: '/recipes.json'
          fields: recipe
          file: file).progress((evt) ->
          progressPercentage = parseInt(100.0 * evt.loaded / evt.total)
          return
        ).success((data, status, headers, config) ->
          console.log data
          $location.path("/recipes/#{data.id}") 
        ).error (data, status, headers, config) ->
          console.log "error:", data

      $scope.save = ->
        onError = (_httpResponse)-> flash.error = "Something went wrong"
        if $scope.recipe.id
          $scope.upload $scope.file, $scope.recipe
        else
          $scope.upload_new $scope.file, $scope.recipe

      $scope.delete = ->
        $scope.recipe.$delete()
        $scope.back()
        
])