class RecipesController < ApplicationController
  
  skip_before_filter :verify_authenticity_token
  
  def index
    @recipes = params[:keywords].present? ? Recipe.where('name ilike ?',"%#{params[:keywords]}%") : Recipe.all
  end
  
  def create
    @recipe = Recipe.new(
      name: params[:name],
      instructions: params[:instructions],
      image: params[:file]
    )
    p "params create"
    p params
    @recipe.save
    render 'show', status: 201
  end
 
  def update
    p "params update"
    p params
    recipe = Recipe.find(params[:id])
    ( recipe.image = params[:file] ) if params[:file]
    recipe.update_attributes(recipe_params)
    head :no_content
  end
 
  def destroy
    recipe = Recipe.find(params[:id])
    recipe.destroy
    head :no_content
  end
  
  def show
    @recipe = Recipe.find(params[:id])
  end
  
  private 
    def recipe_params
      params.require(:recipe).permit(:name,:instructions,:image)
    end 
end
