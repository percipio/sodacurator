class SodasController < ApplicationController
  def index
    @sodas = Soda.where(published: true).order(release_date: :desc).page(params[:page])
    @links = @sodas.each(&:title)
  end

  def show
    @soda = Soda.find_by_title_url(params[:id])
    unless @soda
      flash[:notice] = 'That soda doesn\'t exist, may I suggest one of these?'
      redirect_to sodas_random_path
    end
  end

  def top_pick
    @picks = Soda.where(:rating == 5).order(:name).limit(5)
  end

  def featured
    @sodas = Soda.where(published: :true, featured: :true).order(rating: :desc).limit(5)
  end

  def random
    @sodas = Soda.where(published: :true).order('RANDOM()').limit(5)
  end

  def feed
    @sodas = Soda.all.where(published: true)
    respond_to do |format|
      format.atom { render template: 'blog/feed.atom.builder' }
    end
  end
end
