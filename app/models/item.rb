class Item < ApplicationRecord
  has_many :cart_items
  belongs_to :genre
  has_many :order_items
  attachment :image

  def taxprice
    tax = 1.1
    (price * tax).floor
  end
  
end
