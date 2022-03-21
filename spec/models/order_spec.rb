require 'rails_helper'

RSpec.describe Order, type: :model do
  describe "Associations" do
    it{is_expected.to belong_to(:user)}
    it{is_expected.to have_many(:order_details).dependent(:destroy)}
    it{is_expected.to have_many(:books).through(:order_details)}
  end

  describe "Enums" do
    it {
      should define_enum_for(:status)
        .with_values(pending: 0, rejected: 1, accepted: 2,
                     shipped: 3, delivered: 4, canceled: 5)
        .with_prefix
    }
  end

  describe "Validations" do
    before {FactoryBot.build :order}

    context "with delivery address field" do
      it{is_expected.to validate_presence_of(:delivery_address)}
    end

    context "with delivery phone field" do
      it{is_expected.to validate_presence_of(:delivery_phone)}
      it{is_expected.to validate_length_of(:delivery_phone).is_at_most(Settings.digit_10)}
    end
  end

  describe "callbacks method" do
    let(:order){FactoryBot.create :order}
    before do
      @quantity = order.books.first.quantity
    end

    context "when status change to reject" do
      it "restore book quantity" do
        order.status_rejected!
        order.reload
        expect(order.books.first.quantity).to eq(@quantity + order.order_details.first.quantity)
      end
    end
    context "when status change to pending" do
      it "reduce book quantity" do
        order.status_pending!
        order.reload
        expect(order.books.first.quantity).to eq(@quantity - order.order_details.first.quantity)
      end
    end
  end
end
