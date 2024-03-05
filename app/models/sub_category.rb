class SubCategory < ApplicationRecord
  belongs_to :category

  scope :visible, -> { where(active: true) }
end
