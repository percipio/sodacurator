class BottlersController < ApplicationController
  def index
    @bottlers = Bottler.order(:name).page(params[:page])
    @links = @bottlers.each(&:name)
  end

  def show
    @bottler = Bottler.find_by_name_url(params[:id])
    unless @bottler
      flash[:notice] = 'That bottler doesn\'t exist, may I suggest one of these?'
      redirect_to bottlers_random_path
    end
  end

  def featured
    @bottlers = Bottler.where(featured: :true).order(rating: :desc).limit(5)
  end
end
