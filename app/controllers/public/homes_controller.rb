class Public::HomesController < ApplicationController
  def top
    @item = Item.all
    @item_new = Item.order(created_at: :desc).limit(4)
  end

  def about
  end
end
