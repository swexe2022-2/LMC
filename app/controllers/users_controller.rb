class UsersController < ApplicationController
  def new
     @user = User.new
  end
  
  def show
    @recipes = Recipe.where( user_id: current_user.id)
  end
  
  def edit
    @user = current_user
  
  end
  
  def update
    
      @user = current_user
      logger.debug(params[:user][:name])
      logger.debug(params[:user][:mail])
      logger.debug(params[:user][:password])
      name = params[:user][:name]
      mail = params[:user][:mail]
      password = params[:user][:password]
      password_confirmation=params[:user][:password_confirmation]
      
      if password == nil or password_confirmation == nil
        if @user.update(name: name, mail: mail)
          flash[:notice] = 'アカウント情報を変更しました'
          redirect_to user_path(current_user.id)
        else
          flash[:notice] = 'アカウント情報の更新に失敗しました'
          redirect_to edit_user_path("#{current_user.id}")
        end
      else
        if password != password_confirmation
          flash[:notice] = 'パスワードが一致していません'
          redirect_to edit_user_path("#{current_user.id}")
        elsif @user.update(name: name, mail: mail,
          password: password, password_confirmation: password_confirmation)
          flash[:notice] = 'アカウント情報を変更しました'
          redirect_to user_path(current_user.id)
        else
          flash[:notice] = 'アカウント情報の更新に失敗しました'
          redirect_to edit_user_path("#{current_user.id}")
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
