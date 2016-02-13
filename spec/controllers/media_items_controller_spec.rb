require 'rails_helper'

RSpec.describe MediaItemsController, type: :controller do
  describe "POST create" do
    before { sign_in :user, FactoryGirl.create(:user) }
    after  { sign_out :user }

    it "redirects to root if successfully creates" do
      post :create, { media_item: { link: "some_link", title: "some" }}
      expect(response).to redirect_to(root_path)
    end

    it "renders form if validations failed" do
      post :create, { media_item: { link: "", title: "" }}
      expect(response).to render_template(:new)
    end
  end
end
