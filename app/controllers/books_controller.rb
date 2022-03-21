class BooksController < ApplicationController
  def index
    @search = Book.ransack params[:q]
    @pagy, @books = pagy @search.result,
                         items: Settings.page_items_10
  end

  def show
    @book = Book.find_by(id: params[:id])
    return if @book

    flash[:danger] = t "not_found"
    redirect_to root_path
  end
end
