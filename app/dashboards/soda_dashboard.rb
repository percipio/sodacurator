require 'administrate/base_dashboard'

class SodaDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    tagged_sodas: Field::HasMany,
    tags: Field::HasMany,
    id: Field::Number,
    title: Field::String,
    preview: Field::Text,
    body: Field::Text,
    release_date: Field::DateTime,
    title_url: Field::String,
    published: Field::Boolean,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    image: PaperclipField,
    featured: Field::Boolean
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :title,
    :tags,
    :release_date
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :preview,
    :body,
    :release_date,
    :published,
    :tags,
    :updated_at,
    :image,
    :featured
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :title,
    :preview,
    :body,
    :release_date,
    :published,
    :featured,
    :tags,
    :image
  ].freeze

  # Overwrite this method to customize how sodas are displayed
  # across all pages of the admin dashboard.
  #
  def display_resource(soda)
    soda.title.to_s
  end
end
