require 'rails_helper'

RSpec.describe "micro_posts/index", :type => :view do
  before(:each) do
    assign(:micro_posts, [
      MicroPost.create!(
        :user_id => 1,
        :content => "MyText"
      ),
      MicroPost.create!(
        :user_id => 1,
        :content => "MyText"
      )
    ])
  end

  it "renders a list of micro_posts" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
