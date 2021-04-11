class CartItem < ApplicationRecord
  belongs_to :customer
  belongs_to :item
  
  def sub_total
    item.taxprice.to_i * amount.to_i
  end
end
