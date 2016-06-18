require 'spec_helper'

describe QueueItemsController do 
  describe "GET index" do
    it "sets the @queue_items for the authenticated user" do
        richie = Fabricate(:user)
        session[:user_id] = richie.id
        q1 = Fabricate(:queue_item, user: richie)
        q2 = Fabricate(:queue_item, user: richie)
        get :index
        expect(assigns(:queue_items)).to match_array([q1, q2])
    end
    it "redirects to the sign in page if the user is not authenticated ..." do
      get :index
      expect(response).to redirect_to sign_in_path
    end
  end

  describe "POST create" do
    it "redirects to the my queue page ..." do
      session[:user_id] = Fabricate(:user).id
      video = Fabricate(:video)
      post :create, video_id: video.id
      expect(response).to redirect_to my_queue_path
    end
    it "creates a queue item object ... " do
      session[:user_id] = Fabricate(:user).id
      video = Fabricate(:video)
      post :create, video_id: video.id
      expect(QueueItem.count).to eq(1)
    end
    it "creates a queue item that is associated with a video" do
      session[:user_id] = Fabricate(:user).id
      video = Fabricate(:video)
      post :create, video_id: video.id
      expect(QueueItem.first.video).to eq(video)
    end
    it "creates a queue item that is associated with a user" do
      vince = Fabricate(:user)
      session[:user_id] = vince.id
      video = Fabricate(:video)
      post :create, video_id: video.id
      expect(QueueItem.first.user).to eq(vince)
    end
  end

  describe "DELETE destroy" do
    it "redirects to the my queue page" do
      session[:user_id] = Fabricate(:user).id
      queue_item = Fabricate(:queue_item)
      delete :destroy, id: queue_item.id
      expect(response).to redirect_to my_queue_path
    end
    it "deletes the queue item" do
      frankie = Fabricate(:user)
      session[:user_id] = frankie.id
      queue_item = Fabricate(:queue_item, user: frankie)
      delete :destroy, id: queue_item.id
      expect(QueueItem.count).to eq(0)
    end
    it "doesn't delete the queue item if the queue item is not in the current user's queue"
    it "redirects to the sign in page for unauthenticated users "
  end

  describe "POST update_queue" do
    it ""

  end
end


























