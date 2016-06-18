require 'spec_helper'


describe QueueItem do 
  it { should belong_to :user }
  it { should belong_to :video }

  describe "#video_title" do
    it "returns the title of the video it is associated with ..." do
      video = Fabricate(:video, title: "He-Man")
      que = Fabricate(:queue_item, video: video)
      expect(que.video_title).to eq("He-Man")
    end
  end

  describe "#rating" do
    it "returns the rating of the review when the review is present ..." do
      video = Fabricate(:video)
      user = Fabricate(:user)
      review = Fabricate(:review, user: user, video: video, rating: 5)
      que = Fabricate(:queue_item, user: user, video: video)
      expect(que.rating).to eq(5)
    end
    it "returns nil when there is no review present ..." do
      video = Fabricate(:video)
      user = Fabricate(:user)
      que = Fabricate(:queue_item, user: user, video: video)
      expect(que.rating).to eq(nil)
    end
  end

  describe "#category_name" do
    it "returns the category name of the video the queue_item belongs to" do
      category = Fabricate(:category, name: "Action")
      video = Fabricate(:video, category: category)
      queue_item = Fabricate(:queue_item, video: video)
      expect(queue_item.category_name).to eq("Action")
    end
  end

  describe "#category" do
    it "returns the category for the video the queue item beongs to " do
      category = Fabricate(:category, name: "Action")
      video = Fabricate(:video, category: category)
      queue_item = Fabricate(:queue_item, video: video)
      expect(queue_item.category).to eq(category)
    end
  end
end



















  

