require 'spec_helper'

describe Video do
  it { should belong_to(:category)}
  it { should validate_presence_of(:title)} 
  it { should validate_presence_of(:description)}

  describe 'search_by_title' do
    it "returns an empty array if there's no match" do
      futurama = Video.create(title: "Futurama", description: "Talk about a space adventure ...")
      toy_story = Video.create(title: "Toy Story", description: "Can't keep away ...")
      expect(Video.search_by_title('hello')).to eq([])
    end
    it "returns an array with one video for an exact match" do
      futurama = Video.create(title: "Futurama", description: "Talk about a space adventure ...")
      toy_story = Video.create(title: "Toy Story", description: "One day ...")
      expect(Video.search_by_title("Toy Story")).to eq([toy_story])
    end
    it "returns an array with one video for a partial match" do
      futurama = Video.create(title: "Futurama", description: "Talk about a space adventure ...")
      toy_story = Video.create(title: "Toy Story", description: "One day ...")
      expect(Video.search_by_title("urama")).to eq([futurama])
    end
    it "returns an array of all matches ordered by created_at" do
      futurama = Video.create(title: "Futurama", description: "Talk about a space adventure ...", created_at: 1.day.ago)
      back_to_future = Video.create(title: "Back to the Future", description: "One day ...")
      expect(Video.search_by_title("utur")).to eq([back_to_future, futurama])
    end
    it "returns an empty array if the search term is an empty string" do
      futurama = Video.create(title: "Futurama", description: "Talk about space!", created_at: 1.day.ago)
      toy_story = Video.create(title: "Toy Story", description: "One day ...")
      expect(Video.search_by_title("")).to eq([])
    end
  end
end
