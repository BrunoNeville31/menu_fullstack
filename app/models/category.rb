class Category < ApplicationRecord


  scope :visible, -> { where(active: true, sub_category: true) }
end
