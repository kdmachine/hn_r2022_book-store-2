require "rails_helper"

RSpec.describe CategoriesController, type: :controller do
  describe ".show" do
    context "when params_id valid" do
      let(:category){FactoryBot.create :category}

      before do
        get :show, params: {locale: I18n.locale, id: category.id}
      end

      it "should render show" do
        expect(response).to render_template(:show)
      end
    end

    context "when params_id invalid" do
      it "should redirect to root" do
        get :show, params: {locale: I18n.locale, id: -1}
        expect(response).to redirect_to root_path
      end
    end
  end
end
