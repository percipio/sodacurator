require 'administrate/field/base'

class PaperclipField < Administrate::Field::Base
  def url
    data.url
  end

  def thumb
    data.url(:thumb)
  end

  def square
    data.url(:square)
  end

  def medium
    data.url(:medium)
  end

  def large
    data.url(:large)
  end

  def featured
    data.url(:featured)
  end

  def to_s
    data
  end
end
