class SessionsController < ApplicationController
  def destroy
    reset_session
    redirect_to root_path
  end

  def new
    @user = User.new
  end

  def create
    u = User.find_by(email: params[:user][:email])
    if u.present?
      session[:user_id] = u.id
      redirect_to root_path, notice: 'Sesión iniciada'
    else
      redirect_to users_sign_in_path, alert: 'Contraseña incorrecta'
    end
  end
end
