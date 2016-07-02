class TaggedSoda < ActiveRecord::Base
  belongs_to :tag
  belongs_to :soda
end
