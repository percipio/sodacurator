require 'administrate/base_dashboard'

class SodaDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    tagged_soda: Field::HasMany,
    tags: Field::HasMany,
    bottler: Field::BelongsTo,
    id: Field::Number,
    title: Field::String,
    preview: Field::Text,
    body: Field::Text,
    url: Field::String,
    release_date: Field::DateTime,
    rating: Field::Number,
    featured: Field::Boolean,
    title_url: Field::String,
    published: Field::Boolean,
    image_file_name: Field::String,
    image_content_type: Field::String,
    image_file_size: Field::Number,
    image_updated_at: Field::DateTime,
    image: PaperclipField,
    created_at: Field::DateTime,
    updated_at: Field::DateTime
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :tagged_soda,
    :tags,
    :bottler,
    :id
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :tagged_soda,
    :tags,
    :bottler,
    :id,
    :title,
    :preview,
    :body,
    :url,
    :release_date,
    :rating,
    :featured,
    :title_url,
    :published,
    :image
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :tagged_soda,
    :tags,
    :bottler,
    :title,
    :preview,
    :body,
    :url,
    :release_date,
    :rating,
    :featured,
    :title_url,
    :published,
    :image
  ].freeze

  # Overwrite this method to customize how sodas are displayed
  # across all pages of the admin dashboard.
  #
  def display_resource(soda)
    soda.title.to_s
  end
end
