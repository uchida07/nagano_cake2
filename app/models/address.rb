class Address < ApplicationRecord
  def address_display
  '〒' + postal_code + ' ' + addresses + ' ' + name
  end
end
