class UsersController < ApplicationController
  def new
    @user = User.new
  end
  
  def show
    @user = User.find(params[:id])
  end
  
  def edit
    @user = User.find(params[:id])
  
  end
  
  def update
    if params[:user][:name] == nil or params[:user][:mail] == nil
      flash[:notice] = 'アカウント情報の更新に失敗しました1'
      render 'edit'
    else
      @user = User.find(params[:id])
      logger.debug(params[:id])
      name = params[:user][:name]
      mail = params[:user][:mail]
      if @user.update(name: name, mail: mail)
        redirect_to user_path(params[:id])
      else
        flash[:notice] = 'アカウント情報の更新に失敗しました2'
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
        redirect_to root_path
      else
        flash[:notice] = 'パスワードが一致していません'
        redirect_to new_user_path
      end
    end
  end
  
  def destroy
  end
end
