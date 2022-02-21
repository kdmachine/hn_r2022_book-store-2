module BooksHelper
  def load_book
    Book.all
  end

  def find_book id
    return @book if (@book = Book.find_by id: id)

    flash[:danger] = t "not_found"
    redirect_to root_url
  end

  def get_authors_by_book
    Book.book_id.authors
  end

  def price_format number
    number_to_currency(number, unit: "VND", delimiter: ".", format: "%n %u",
      precision: Settings.zero)
  end
end
