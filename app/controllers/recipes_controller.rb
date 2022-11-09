class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
  end
  
  def new
    @recipe = Recipe.new 
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
    image = params[:recipe][:image].read
    movie = params[:recipe][:movie].read
    ingredients = params[:recipe][:ingredients]
    process = params[:recipe][:process]
    tag = params[:recipe][:tag]
    recipe = Recipe.new(fname: fname , ingredients: ingredients,process: process, 
    tag: tag,image: image,movie: movie)
    recipe.save
    
    redirect_to '/'
  end
  
  def show
    @recipe = Recipe.find(params[:id])
  end 
  
  def destroy
    recipe = Recipe.find(params[:id])
    recipe.destroy
    redirect_to '/'
  end
  
  def edit 
    @recipe = Recipe.find(params[:id])
  end
  
  def update
    @home = Home.find(params[:id])
    fname = params[:recipe][:fname]
    image = params[:recipe][:image].read
    movie = params[:recipe][:movie].read
    ingredients = params[:recipe][:ingredients]
    process = params[:recipe][:process]
    tag = params[:recipe][:tag]
    @recipe.update(fname: fname ,ingredients: ingredients,process: process, 
    tag: tag,image: image, movie: movie)
    redirect_to '/'
    
  end
 
end
