require 'spec_helper'

describe UsersController do 
  describe "GET new" do
    it "sets up @user" do 
      get :new
      expect(assigns(:user)).to be_instance_of(User)
    end
  end
  describe 'POST create' do
    context "with valid input" do
      it "creates the user" do
        post :create, user: {email: "a", password: "b", full_name: "c"}
        expect(User.count).to eq(1)
      end
      it "redirects to the sign_in page" do
        post :create, user: {email: "a", password: "b", full_name: "d"}
        expect(response).to redirect_to sign_in_page
      end
    end
    context "with invalid input" do
      it "doesn't create the user" do
        post :create, user: {email: "C", full_name: "minus"}
        expect(User.count).to eq(0)
      end
      it "renders the :new template" do
        post :create, user: {password: "password", full_name: "Johnny Hopkins", email: "@gmail.com"}
        expect(response).to render_template :new 
      end
      it "sets up the user variable" do
        post :create, user: {password: "password", full_name: "Johnny Hopkins", email: "@gmail.com"}
        expect(assigns(:user)).to be_instance_of(User)
      end
    end
  end
end









