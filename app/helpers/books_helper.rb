module BooksHelper
  def load_book
    Book.all
  end

  def get_authors_by_book
    Book.book_id.authors
  end

  def price_format number
    number_to_currency(number, unit: "VND", delimiter: ".", format: "%n %u",
      precision: Settings.zero)
  end
end
