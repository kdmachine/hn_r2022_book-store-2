class BooksController < ApplicationController
  def index; end

  def new; end

  def create; end

  def show
    @book = Book.find_by(id: params[:id])
    return if @book

    flash[:danger] = t "not_found"
    redirect_to root_path
  end
end
