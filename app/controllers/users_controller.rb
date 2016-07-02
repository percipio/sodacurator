class UsersController < ApplicationController
  before_action :signed_in_user, only: [:edit, :update, :destroy]
  before_action :correct_user,   only: [:show, :edit, :update, :destroy]
  before_action :admin_user,     only: [:index, :destroy]

  def show
    @user = User.find_by_username(params[:username])
    if @user && !@user.activated?
      flash.now[:warning] = 'Your account is not yet activated! Check your email.'
    end
  end

  def new
    @user = User.new
    render layout: 'layouts/entry_forms'
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    params[:user][:password] = gen_password unless params[:user][:password]
    params[:user][:password_confirmation] = params[:user][:password]
    params[:user][:username] = gen_username
    @user = User.new(new_user_params)
    if @user.save
      @user.send_activation_email
      @message = 'Please check your email to activate your account'
      sign_in @user
      redirect_to @user
    else
      render 'new', layout: 'layouts/entry_forms'
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(update_user_params)
      flash[:success] = 'Profile update'
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = 'Profile deleted'
    redirect_to users_url
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :username, :password, :password_confirmation)
  end

  def update_user_params
    params.require(:user).permit(:first_name, :last_name, :email, :username,
                                 :password, :password_confirmation)
  end

  # Before Filters

  # Confirms a signed-in user
  def signed_in_user
    unless signed_in?
      store_location
      flash[:danger] = 'Please sign in.'
      redirect_to signin_url
    end
  end

  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless current_user?(@user)
  end

  # Confirms an admin user.
  def authorized
    unless current_user.admin?
      store_location
      flash[:danger] = 'Please sign in.'
      redirect_to signin_url
    end
  end

  def gen_password
    unless params[:user][:password]
      range = [*'0'..'9', *'a'..'z', *'A'..'Z', *'!', *'@', *'*', *'#', *'$', *'%', *'^', *'&', *'?']
      password = Array.new(12) { range.sample }.join
    end
  end

  def gen_username
    unless params[:user][:username]
      range = [*'0'..'9', *'a'..'z', *'A'..'Z']
      characters = Array.new(4) { range.sample }.join
      full_name = params[:user][:first_name] + params[:user][:last_name]
      username = full_name + '_' + characters
    end
  end
end
