class Bottler < ActiveRecord::Base
  has_many :sodas, dependent: :destroy
  has_attached_file :image, styles: {
    thumb: '100x100>',
    square: '200x200#',
    medium: '300x300>',
    large: '750x400>',
    featured: '1200x600>'
  }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
  before_save :downcase_name_url
  validates :name, presence: true,
                   length: { maximum: 144 },
                   uniqueness: { case_sensitive: false }
  def self.names
    names = select(:name_url, :name).order(:name)
  end

  def downcase_name_url
    self.name_url = name_url.downcase
  end
end
