require 'spec_helper' 

describe Category do
  it { should have_many(:videos)}
  it { should validate_presence_of(:name)}

  describe '#recent_videos' do 
    it "should return videos in reverse order of created_at ..." do
      comedies = Category.create(name: "Comedies")
      futurama = Video.create(title: "Futurama", description: "A wa wa ...", category: comedies, created_at: 1.day.ago)
      south_park = Video.create(title: "South Park", description: "A funny adventure that started ...", category: comedies)
      expect(comedies.recent_videos).to eq([futurama, south_park])
    end
    it 'returns all the videos if there is less than 6 ...' do
      comedies = Category.create(name: "Comedies")
      futurama = Video.create(title: "Futurama", description: "A wa wa ...", category: comedies, created_at: 1.day.ago)
      south_park = Video.create(title: "South Park", description: "A funny adventure that started ...", category: comedies)
      expect(comedies.recent_videos.count).to eq(2)
    end
    it 'returns six videos when more than 6 ...' do
      comedies = Category.create(name: "Comedies")
      7.times {Video.create(title: "South Park", description: "A funny adventure that started ...", category: comedies)}
      expect(comedies.recent_videos.count).to eq(6)
    end
    it 'returns 6 most recent videos' do
      comedies = Category.create(name: "Comedies")
      6.times { Video.create(title: "South Park", description: "A funny adventure that started ...", category: comedies)}
      futurama = Video.create(title: "Futurama", description: "A wa wa ...", category: comedies, created_at: 1.day.ago)
      expect(comedies.recent_videos).not_to include(futurama)
    end
    it 'returns an empty array if a category has no videos' do
      comedies = Category.create(name: "Comedies")
      expect(comedies.videos).to eq([])
    end
  end
end















