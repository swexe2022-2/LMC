class UsersController < ApplicationController
  def new
     @user = User.new
  end
  
  def show
    @user = User.find(params[:id])
    @recipes = Recipe.where( user_id: params[:id])
  end
  
  def edit
    @user = User.find(params[:id])
  
  end
  
  def update
    if params[:user][:name] == nil or params[:user][:mail] == nil
      flash[:notice] = 'アカウント情報の更新に失敗しました'
      render 'edit'
    else
      @user = User.find(params[:id])
      logger.debug(params[:id])
      name = params[:user][:name]
      mail = params[:user][:mail]
      if @user.update(name: name, mail: mail)
        redirect_to user_path(params[:id])
      else
        flash[:notice] = 'アカウント情報の更新に失敗しました'
        logger.debug(params[:user][:name])
        logger.debug(params[:user][:mail])
        render 'edit'
      end
    end
      
  end
  
  def create
    if User.find_by(name: params[:user][:name])
      flash[:notice] = 'そのユーザー名はすでに使われています'
      redirect_to new_user_path
    else
      name = params[:user][:name]
      password = params[:user][:password]
      password_confirmation = params[:user][:password_confirmation]
      mail = params[:user][:mail]
      logger.debug(password)
      logger.debug(password_confirmation)
      @user = User.new(name: name, password: password,
      password_confirmation: password_confirmation, mail: mail)
      logger.debug(@user.pass)
      if @user.save
        flash[:notice] = 'アカウントの作成に成功しました'

        redirect_to top_main_path
      elsif password != password_confirmation
        flash[:notice] = 'パスワードが一致していません'
        redirect_to new_user_path
      else
        flash[:notice] = 'アカウントの作成に失敗しました'
        redirect_to new_user_path
      end
    end
  end
  
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:notice] = '退会しました'
    redirect_to root_path
  end
end
