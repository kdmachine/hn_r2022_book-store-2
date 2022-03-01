class CategoriesController < ApplicationController
  before_action :load_book

  def show
    @category = Category.find_by id: params[:id]
    return if @category

    flash[:danger] = t "not_found"
    redirect_to root_path
  end

  private
  def load_book
    @books = Book.load_book_in_category(params[:id])
  end
end
