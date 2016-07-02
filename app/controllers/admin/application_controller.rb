# All Administrate controllers inherit from this `Admin::ApplicationController`,
# making it the ideal place to put authentication logic or other
# before_filters.
#
# If you want to add pagination or other controller-level concerns,
# you're free to overwrite the RESTful controller actions.
module Admin
  class ApplicationController < Administrate::ApplicationController
    include SessionsHelper
    before_filter :signed_in, :authorized

    # Confirms an admin user.
    def signed_in
      unless signed_in?
        store_location
        flash[:alert] = 'Please sign in.'
        redirect_to signin_path
      end
    end

    def authorized
      unless current_user.admin?
        store_location
        flash[:error] = 'You are not an admin.'
        redirect_to signin_path
      end
    end

    # Override this value to specify the number of elements to display at a time
    # on index pages. Defaults to 20.
    # def records_per_page
    #   params[:per_page] || 20
    # end
  end
end
