class Admin::AccountsController < AdminController
  authorize_resource class: false

  def index; end
end
