class Admin::ProductsController < AdminController
  authorize_resource class: false

  def index; end
end
