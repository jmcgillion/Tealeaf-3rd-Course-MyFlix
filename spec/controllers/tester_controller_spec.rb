require 'spec_helper'

describe VideosController
  describe "POST search" do 
    context "authenticated" do
      session[:user_id] = Fabricate(:user).id

      it "sets up the @results variable" do

        futurama = Fabricate(:video)
        toy_story = Fabricate(:video)
        POST :search
        expect(assigns(@reviews)).to eq([futurama, toy_story])

      end
      it "renders the search template"
      P

    end
  end
end

