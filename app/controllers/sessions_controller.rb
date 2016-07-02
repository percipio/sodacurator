class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      if user.admin?
        flash.now[:success] = 'Logged In...'
        sign_in user
        redirect_to(admin_root_path) && return
      end
      if user.activated?
        sign_in user
        params[:session][:remember_me] == '1' ? remember(user) : forget(user)
        redirect_back_or admin_root_path
      else
        message = 'Account not activated. '
        message += 'Check your email for the activation link.'
        flash.now[:notice] = message
        sign_in user
        redirect_to admin_root_path
     end
    else
      flash.now[:alert] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    sign_out if signed_in?
    flash[:notice] = 'See you next time!'
    redirect_to root_path
  end
end
