class PasswordResetsController < ApplicationController
  before_action :get_user,         only: [:edit, :update]
  before_action :valid_user,       only: [:edit, :update]
  before_action :check_expiration, only: [:edit, :update]

  def new
    render layout: 'layouts/entry_forms'
  end

  def create
    @user = User.find_by(email: params[:password_reset][:email].downcase)
    if @user
      @user.create_reset_digest
      @user.send_password_reset_email
      flash[:notice] = 'Email sent with password reset instructions'
      redirect_to signin_path
    else
      flash.now[:alert] = 'Email address not found'
      render 'new', layout: 'layouts/entry_forms'
    end
  end

  def edit
    render layout: 'layouts/entry_forms'
  end

  def update
    if blank_passwords?
      flash.now[:alert] = "Password/confirmation can't be blank"
      render 'edit', layout: 'layouts/entry_forms'
    elsif @user.update_attributes(user_params)
      sign_in @user
      flash[:success] = 'Password has been reset. You have been signed in.'
      if @user.admin?
        redirect_to admin_path
      else
        redirect_to edit_admin_user_path(@user)
      end
    else
      render 'edit', layout: 'layouts/entry_forms'
    end
  end

  private

  def user_params
    params.require(:user).permit(:password, :password_confirmation)
  end

  # Returns true if password & confirmation are blank.
  def blank_passwords?
    params[:user][:password].blank? ||
      params[:user][:password_confirmation].blank?
  end

  def get_user
    @user = User.find_by(email: params[:email])
  end

  # Confirms a valid user.
  def valid_user
    unless @user && @user.activated? &&
           @user.authenticated?(:reset, params[:id])
      redirect_to root_url
    end
  end

  # Checks expiration of reset token.
  def check_expiration
    if @user.password_reset_expired?
      flash[:danger] = 'Password reset has expired.'
      redirect_to new_password_reset_url
    end
  end
end
