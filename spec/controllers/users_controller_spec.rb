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
      it "creates the user object"
      it "redirects to the sign_in page"
    end
    context "with invalid input" do
      it "renders the new template"
    end
  end
end









