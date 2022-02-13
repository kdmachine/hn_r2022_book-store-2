module BooksHelper
  def load_book
    Book.all
  end

  def get_authors_by_book
    Book.book_id.authors
  end
end
