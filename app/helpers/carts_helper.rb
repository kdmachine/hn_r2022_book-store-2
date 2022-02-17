module CartsHelper
  def total_price
    @cart.reduce(Settings.zero) do |total, item|
      total + item["quantity"] * find_book(item["book_id"]).price
    end
  end
end
