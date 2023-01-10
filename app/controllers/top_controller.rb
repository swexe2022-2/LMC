class TopController < ApplicationController
  def main
    if current_user
      redirect_to recipes_path
    else
      render "login.html.erb"
    end
  end
  
  def login
    name = params[:name]
    pass = params[:pass]
    user= User.find_by(name: name)
    if user == nil
      flash.now[:notice] = 'ユーザーが存在しません。'
      render "login.html.erb"
    else
      if BCrypt::Password.new(user.pass) == pass
        session[:login_name] = name
        flash.now[:notice] = "ログインしました（#{session[:login_name]}）"
        redirect_to recipes_path
      elsif BCrypt::Password.new(user.pass) != pass
        flash.now[:notice] = 'パスワードが間違っています'
        render "login.html.erb"
      else
        flash.now[:notice] = 'ログインに失敗しました'
        render "login.html.erb"
      end
    end
  end
  
  def logout
    session[:login_name] = nil
    flash[:notice] = 'ログアウトしました'
    redirect_to root_path
  end
  
  
end
