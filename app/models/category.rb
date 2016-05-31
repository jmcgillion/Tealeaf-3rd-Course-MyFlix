class Category < ActiveRecord::Base
  has_many :videos

  def recent_videos
    videos.first(6)
  end
end







