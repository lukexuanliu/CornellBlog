require 'spec_helper'
require 'rails_helper'

#
describe "Static pages" do
  describe "Home page" do
    it "should have the content 'CornellBlog'" do
      visit '/static_pages/home'
      expect(page).to have_selector('h1', :text => 'CornellBlog')
    end

    it "should have the title 'Home'" do
    	visit '/static_pages/home'
    	expect(page).to have_title('CornellBlog | Home')
    end
  end

#
describe "Help page" do

    it "should have the content 'Help'" do
      visit '/static_pages/help'
      expect(page).to have_selector('h1', :text => 'Help')
    end

    it "should have the title 'Help'" do
      visit '/static_pages/help'
      expect(page).to have_title('CornellBlog | Help')
    end
  end

end

#
describe "About page" do

    it "should have the content 'Help'" do
      visit '/static_pages/about'
      expect(page).to have_selector('h1', :text => "About")
    end

    it "should have the title 'Home'" do
      visit '/static_pages/about'
      expect(page).to have_title('CornellBlog | About')
    end
end
