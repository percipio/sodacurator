module ApplicationHelper
  def app_name
    @app_name = 'Soda Curator'
  end

  def featured_sodas
    @featured_sodas = Soda.where(published: true, featured: true)
                          .order(release_date: :desc)
                          .limit(3)
  end

  def featured_bottler
    @featured_bottler = Bottler.where(featured: true)
                               .order(:name)
                               .limit(1)
  end

  def full_name
    "#{current_user.first_name} #{current_user.last_name}"
  end

  def links
  end

  def rating
    @rating = %w(1,2,3,4,5)
  end

  def full_title
    if content_for?(:title)
      content_tag(:title, "#{content_for(:title)} | #{app_name}")
    else
      content_tag(:title, app_name)
    end
  end

  def format_date(time)
    if time.class === 'String'
      Date.parse(time).strftime('%B %Y')
    else
      time.strftime('%B %Y')
    end
  end

  def page_title
    if content_for?(:title)
      content_for(:title)
    else
      @app_name
    end
  end

  def title(title)
    content_for(:title, title)
  end

  def logo_image(size = 80)
    gravatar_id = Digest::MD5.hexdigest('me@joehale.io')
    size = size
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    image_tag(gravatar_url, alt: app_name, class: 'logo image')
  end

  def my_gravatar(option = 100)
    gravatar_id = Digest::MD5.hexdigest('jmartyhale@gmail.com')
    size = option
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    image_tag(gravatar_url, alt: app_name.to_s, class: 'gravatar')
  end

  def copyright_notice(start_year)
    start_year = start_year.to_i
    current_year = Time.zone.now.year

    if (1900..2100).cover?(start_year)
      if current_year == start_year
        current_year.to_s
      else
        "#{start_year} - #{current_year}"
      end
    else
      current_year.to_s
    end
  end
end
