require "rails_helper"

RSpec.describe CartsController, type: :controller do
  let(:category){FactoryBot.create :category}
  let(:book){FactoryBot.create :book, category_id: category.id}
  let(:user){FactoryBot.create :user, role: 0}

  describe ".create" do
    before do
      @cart_params = {
        "book_id" => 1,
        "quantity" => 1
      }
      post :create, params: {cart: @cart_params}
    end
    context "with params" do
      it "should create a cart item" do
        assigns(:cart).should_not be_empty
      end
    end
    context "without params" do
      it "should not create a cart item" do
        expect {post :create}.to raise_error(NoMethodError)
      end
    end
  end

  describe ".destroy" do
    before do
      @cart_params = {
        "book_id" => 1,
        "quantity" => 1
      }
      post :create, params: {cart: @cart_params}
      @id = assigns(:cart)[0][:book_id]
      post :destroy, params: {book_id: @id}
    end
  end
end
