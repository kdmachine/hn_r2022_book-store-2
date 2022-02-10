class Admin::BooksController < AdminController
  before_action :load_book, except: %i(index new create)

  def index
    @pagy, @books = pagy Book.recent_add
  end

  def show; end

  def new
    @book = Book.new
    @book.book_authors.build
  end

  def create
    @book = Book.new book_params
    if @book.save
      flash[:success] = t ".success"
      redirect_to admin_books_path
    else
      flash.now[:danger] = t ".fail"
      render :new
    end
  end

  def edit; end

  def update; end

  def destroy; end

  private

  def book_params
    params.require(:book).permit Book::PROPERTIES
  end

  def load_book
    @book = Book.find_by id: params[:id]
    return if @book

    flash[:danger] = t "not_found"
    redirect_to admin_root_path
  end
end
