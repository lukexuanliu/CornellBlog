require 'rails_helper'

RSpec.describe "micro_posts/edit", :type => :view do
  before(:each) do
    @micro_post = assign(:micro_post, MicroPost.create!(
      :user_id => 1,
      :content => "MyText"
    ))
  end

  it "renders the edit micro_post form" do
    render

    assert_select "form[action=?][method=?]", micro_post_path(@micro_post), "post" do

      assert_select "input#micro_post_user_id[name=?]", "micro_post[user_id]"

      assert_select "textarea#micro_post_content[name=?]", "micro_post[content]"
    end
  end
end
