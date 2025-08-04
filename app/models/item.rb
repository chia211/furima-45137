class Item < ApplicationRecord
  belong_to :user
  has_one :order
end
