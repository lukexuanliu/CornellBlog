require "rails_helper"

RSpec.describe MicroPostsController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/micro_posts").to route_to("micro_posts#index")
    end

    it "routes to #new" do
      expect(:get => "/micro_posts/new").to route_to("micro_posts#new")
    end

    it "routes to #show" do
      expect(:get => "/micro_posts/1").to route_to("micro_posts#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/micro_posts/1/edit").to route_to("micro_posts#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/micro_posts").to route_to("micro_posts#create")
    end

    it "routes to #update" do
      expect(:put => "/micro_posts/1").to route_to("micro_posts#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/micro_posts/1").to route_to("micro_posts#destroy", :id => "1")
    end

  end
end
