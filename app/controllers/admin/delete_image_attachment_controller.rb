class Admin::DeleteImageAttachmentController < AdminController
  before_action :load_book

  def delete_image_attachment
    @image = ActiveStorage::Attachment.find_by id: params[:id]
    return redirect_to admin_books_path unless @image

    @image.purge
    @book = Book.find_by id: @image.record_id
    return redirect_to admin_books_path unless @book
  end
end
