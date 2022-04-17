class Item < ApplicationRecord
  has_one_attached :image
  has_many :cart_items, dependent: :destroy
  # belongs_to :order
  has_many :order_datails, dependent: :destroy

  def with_tax_price
    (price * 1.1).floor
  end

end
