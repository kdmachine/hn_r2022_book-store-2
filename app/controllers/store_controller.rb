class StoreController < ApplicationController
  before_action :authenticate_user!
  before_action :init_cart, only: %i(checkout)

  def home; end

  def checkout; end
end
