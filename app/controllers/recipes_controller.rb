class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
    @tag_list = ["朝ごはん","昼ごはん","夜ごはん","和食","洋食","インド料理",
      "中華料理","韓国料理","イタリア料理","フランス料理","メキシコ料理","南国系",
      "サラダ類","ヘルシー","節約"]
  end
  
  def new
    if current_user == nil
      redirect_to new_user_path
    else
      @recipe = Recipe.new
    end
  end
  
  def get_reciepe
    recipe = Recipe.find(params[:id]) #↓詳細は説明を後述する
    send_data recipe.image, type: 'recipe/png'
    #end_data recipe.movie, disposition: :inline,type: 'recipe/mp4'
  end
  def get_reciepe2
    recipe = Recipe.find(params[:id]) #↓詳細は説明を後述する
    send_data recipe.movie, disposition: :inline,type: 'recipe/mp4'
  end
  
  def create
    fname = params[:recipe][:fname]
    if params[:recipe][:image] == nil
      image = nil
    else
      image = params[:recipe][:image].read
    end  
    if params[:recipe][:movie] == nil
      movie = nil
    else
      movie = params[:recipe][:movie].read
    end
    
    ingredients = params[:recipe][:ingredients]
    process = params[:recipe][:process]
    tag = params[:recipe][:tag]
    recipe = Recipe.new(fname: fname , ingredients: ingredients,process: process, 
    tag: tag,image: image,movie: movie)
    user = User.find(current_user.id)
    #user.recipe << recipe

    recipe.user = user
    recipe.save
    
    redirect_to '/'
  end
  
  def show
    @recipe = Recipe.find(params[:id])
  end 
  
  def destroy
    print("destroy")
    recipe = Recipe.find(params[:id])
    recipe.destroy
    redirect_to '/'
  end
  
  def edit
    @recipe = Recipe.find(params[:id])
    if current_user != @recipe.user
      redirect_to recipe_path(params[:id])
    end
  end
  
  def update
    @recipes = Recipe.find(params[:id])
    fname = params[:recipe][:fname]
    if params[:recipe][:image] == nil
      image = nil
    else
      image = params[:recipe][:image].read
    end  
    if params[:recipe][:movie] == nil
      movie = nil
    else
      movie = params[:recipe][:movie].read
    end
    ingredients = params[:recipe][:ingredients]
    process = params[:recipe][:process]
    tag = params[:recipe][:tag]
    @recipes.update(fname: fname ,ingredients: ingredients,process: process, 
    tag: tag,image: image, movie: movie)
    redirect_to '/'
    
  end
 
    def search
      @recipes = Recipe.search(params[:keyword])
      @keyword = params[:keyword]
      @tag_list = ["朝ごはん","昼ごはん","夜ごはん","和食","洋食","インド料理",
      "中華料理","韓国料理","イタリア料理","フランス料理","メキシコ料理","南国系",
      "サラダ類","ヘルシー","節約"]
      render "index"
    end 
end