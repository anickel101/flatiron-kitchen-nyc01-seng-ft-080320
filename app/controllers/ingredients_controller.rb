class IngredientsController < ApplicationController

    def index
        @ingredients = Ingredient.all
    end

    def show
        @ingredient = get_ingredient
    end


    def new
        @ingredient = Ingredient.new
    end

    def create
        @ingredient = Ingredient.create(ingredient_params)
        if @ingredient.valid?
            redirect_to ingredient_path(@ingredient)
        else
            flash[:my_errors] = @ingredient.errors.full_messages
            redirect_to new_ingredient_path
        end
    end

    def edit
        @ingredient = get_ingredient
    end

    def update
        @ingredient = get_ingredient
        @ingredient.update(ingredient_params)
        if @ingredient.valid?
            redirect_to ingredient_path(@ingredient)
        else
            flash[:my_errors] = @ingredient.errors.full_messages
            redirect_to edit_ingredient_path
        end
    end

    private

    def get_ingredient
        Ingredient.find(params[:id])
    end

    def ingredient_params
        params.require(:ingredient).permit(:name)
    end

end
