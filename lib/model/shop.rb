class Shop
  attr_reader :shop_id, :shop_name

  def initialize(shop_id, shop_name)
    @shop_id = shop_id
    @shop_name = shop_name
  end
end