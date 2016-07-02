class Soda < ActiveRecord::Base
  has_many :tagged_soda, dependent: :destroy
  has_many :tags, through: :tagged_soda
  belongs_to :bottler
  has_attached_file :image, styles: {
    thumb: '100x100>',
    square: '200x200#',
    medium: '300x300>',
    large: '750x400>',
    featured: '1200x600>'
  }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
  before_save :downcase_title_url
  validates :title_url, presence: true,
                        length: { maximum: 144 },
                        uniqueness: { case_sensitive: false }

  def self.titles
    titles = select(:title_url, :title, :published, :release_date).order(:release_date).limit(4)
  end

  private

  # Converts title_url to all lower-case
  def downcase_title_url
    self.title_url = title_url.downcase
  end
end
