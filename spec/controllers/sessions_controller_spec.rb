require 'spec_helper'

describe SessionsController do 
  describe "GET new" do
    it "renders the new template for unauthenticated users" do
      get :new
      expect(response).to render_template :new
    end
    it "redirects to the home page if authenticated user" do
      session[:user_id] = Fabricate(:user).id
      get :new
      expect(response).to redirect_to home_path
    end
  end
  describe "POST create" do
    context "if valid credentials..." do
      it "signs in user to login session" do
        alice = Fabricate(:user)
        post :create, email: alice.email, password: alice.password
        expect(session[:user_id]).to eq(alice.id)
      end
      it "redirects to the home page" do
        alice = Fabricate(:user)
        post :create, email: alice.email, password: alice.password
        expect(response).to redirect_to home_path 
      end
    end
    context "if invalid ..." do
      it "does not put user in to the session" do
        alice = Fabricate(:user)
        post :create, email: alice.email, password: alice.password + 'asdfasdf'
        expect(session[:user_id]).to be_nil
      end
      it "redirects to the sign in page" do
        alice = Fabricate(:user)
        post :create, email: alice.email, password: alice.password + 'asdfasdf'
        expect(response).to redirect_to sign_in_path
      end
      it "sets the error message" do
        alice = Fabricate(:user)
        post :create, email: alice.email, password: alice.password + 'asdfasdf'
        expect(flash[:error]).not_to be_blank
      end
    end
  end
end



