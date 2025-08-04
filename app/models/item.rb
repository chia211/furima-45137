class Item < ApplicationRecord
  belong_to :user
  has_one :order
  has_one_attached :image
end
