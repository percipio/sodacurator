class Tag < ActiveRecord::Base
  has_many :tagged_sodas, dependent: :destroy
  has_many :sodas, through: :tagged_sodas
end
