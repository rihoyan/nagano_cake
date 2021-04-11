class Address < ApplicationRecord
  belongs_to :customer

  def pcode_address_name
    "〒" + self.postal_code + self.addresses + self.name
  end
end
