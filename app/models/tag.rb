class Tag < ActiveRecord::Base
  has_many :tagged_soda, dependent: :destroy
  has_many :sodas, through: :tagged_soda
end
