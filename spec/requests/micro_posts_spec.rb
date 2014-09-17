require 'rails_helper'

RSpec.describe "MicroPosts", :type => :request do
  describe "GET /micro_posts" do
    it "works! (now write some real specs)" do
      get micro_posts_path
      expect(response).to have_http_status(200)
    end
  end
end
