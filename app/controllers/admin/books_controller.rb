class Admin::BooksController < AdminController
  authorize_resource class: false

  before_action :load_book, except: %i(index new create)
  before_action :check_order_details, only: :destroy

  def index
    @search = Book.ransack params[:q]
    @pagy, @books = pagy @search.result,
                         items: Settings.page_items_10
  end

  def show; end

  def new
    @book = Book.new
    @book.book_authors.build
  end

  def create
    @book = Book.new book_params
    insert_to_book_author

    if @book.save
      flash[:success] = t "success"
      redirect_to admin_books_path
    else
      flash.now[:danger] = t "fail"
      render :new
    end
  end

  def edit; end

  def update
    ActiveRecord::Base.transaction do
      book_image_attach

      @book.update! book_params
      handle_success_update_book
    end
  rescue StandardError => e
    handle_exception e
  end

  def destroy
    if @book.destroy
      flash[:success] = t "success"
    else
      flash[:danger] = t "fail"
    end
    redirect_to admin_books_path
  end

  private

  def book_params
    params.require(:book).permit Book::PROPERTIES
  end

  def load_book
    @book = Book.find_by id: params[:id]
    return if @book

    flash[:danger] = t "not_found"
    redirect_to admin_books_path
  end

  def book_image_attach
    @book.images.attach params[:book][:images] if params[:book][:images]
  end

  def insert_to_book_author
    params.dig(:book, :book_authors, :author_id)&.compact_blank!&.each do |val|
      @book.book_authors.build[:author_id] = val
    end
  end

  def handle_success_update_book
    flash[:success] = t "success"
    redirect_to admin_books_path
  end

  def handle_exception _exception
    flash[:danger] = t "error"
    redirect_back fallback_location: admin_books_path
  end

  def check_order_details
    return if @book.order_details.empty?

    flash[:danger] = t "dont_move_book"
    refresh
  end
end
