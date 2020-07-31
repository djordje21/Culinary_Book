class RecipesController < ApplicationController
  before_action :find_book, only: [:show, :edit, :update, :destroy]

  def index
  	@recipes = Recipe.all.order("created_at DESC")
  end

   def show
  end

  def new
  	@recipe = current_user.recipes.build
  end

  def create
  	@recipe = current_user.recipes.build(recipe_params)

  	if @recipe.save
  		redirect_to root_path
  	else
  		render 'new'
  	end
  end

  def edit
  end

  def update
  	if @recipe.update(recipe_params)
  		redirect_to recipe_path(@recipe)
  	else
  		render 'edit'
  	end
  end

  def destroy
  	@recipe.destroy
  	redirect_to root_path
  end
  	
end



private
def recipe_params
	params.require(:recipe).permit(:title, :preparation, :author)
end

def find_book
  	@recipe = Recipe.find(params[:id])

end
