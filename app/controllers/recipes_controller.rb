class RecipesController < ApplicationController

    def index
        @recipes = Recipe.all
    end

    def show
        @recipe = get_recipe
    end

    def new
        @recipe = Recipe.new
        @ingredients = Ingredient.all
    end

    def create
        @recipe = Recipe.create(recipe_params)
        if @recipe.valid?
            redirect_to recipe_path(@recipe)
        else
            flash[:my_errors] = @recipe.errors.full_messages
            redirect_to new_recipe_path
        end
    end

    def edit
        @recipe = get_recipe
        @ingredients = Ingredient.all
    end

    def update
        @recipe = get_recipe
        @recipe.update(recipe_params)
        if @recipe.valid?
            redirect_to recipe_path(@recipe)
        else
            flash[:my_errors] = @recipe.errors.full_messages
            redirect_to edit_recipe_path
        end
    end

    private

    def get_recipe
        Recipe.find(params[:id])
    end

    def recipe_params
        params.require(:recipe).permit(:name, ingredient_ids: [])
    end

end