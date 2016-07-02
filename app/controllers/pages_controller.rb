class PagesController < ApplicationController
  def home
    @sodas = Soda.where(published: true).order(release_date: :desc).limit(3)
    @links = @sodas.each(&:title)
  end

  def about
  end

  def contact
  end

  def terms_and_conditions
  end

  def privacy_policy
  end

  def thank_you
  end

  def thanks
  end

  def launch_signup
  end

  def confirmation_sent
  end
end
