require 'spec_helper'

describe VideosController do
  describe "GET show" do
    context "with authenticated users" do
      before do
        session[:user_id] = Fabricate(:user).id
      end

      it 'sets up the @video' do
        video = Fabricate(:video)
        get :show, id: video.id
        expect(assigns(:video)).to eq(video)
      end
    end

    context "with unauthenticated users" do
      it "redirects the user to the sign_in page" do
        video = Fabricate(:video)
        get :show, id: video.id
        expect(response).to redirect_to sign_in_path
      end
    end
  end

  describe "POST search" do
    it "sets @results for authenticated users" do
      session[:user_id] = Fabricate(:user).id
      futurama = Fabricate(:video, title: "Futurama")
      post :search, search_term: 'rama'
      expect(assigns(:results)).to eq([futurama])
    end
    it "redirects to sign_in page for unauthenticated users" do
      futurama = Fabricate(:video, title: "Futurama")
      post :search, search_term: 'rama'
      expect(response).to redirect_to sign_in_path
    end
  end
end





















