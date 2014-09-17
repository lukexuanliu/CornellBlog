require 'rails_helper'

RSpec.describe "micro_posts/show", :type => :view do
  before(:each) do
    @micro_post = assign(:micro_post, MicroPost.create!(
      :user_id => 1,
      :content => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/1/)
    expect(rendered).to match(/MyText/)
  end
end
