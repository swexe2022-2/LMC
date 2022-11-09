class UsersController < ApplicationController
  def new
    @user = User.new
  end
  
  def show
    @user = User.find(params[:id])
  end
  
  def edit
  end
  
  def create
    name = params[:user][:name]
    password = params[:user][:password]
    password_confirmation = params[:user][:password_confirmation]
    mail = params[:user][:mail]
    if User.find_by(name: name)
      flash[:notice] = 'そのユーザーIDはすでに使われています'
      redirect_to new_user_path
    else
      user = User.new(name: name, password: password,
      password_confirmation: password_confirmation, mail: mail)
    end
    
    if user.save
      flash[:notice] = "ユーザー登録が完了しました(ユーザー名:#{params[:user][:name]})"
      redirect_to root_path
    else
      flash[:notice] = 'ユーザー登録に失敗しました'
      redirect_to new_user_path
    end
  end
  
  def destroy
  end
end
