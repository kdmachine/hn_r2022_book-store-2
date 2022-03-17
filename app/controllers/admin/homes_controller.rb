class Admin::HomesController < AdminController
  authorize_resource class: false

  def index; end
end
