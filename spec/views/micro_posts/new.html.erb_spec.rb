require 'rails_helper'

RSpec.describe "micro_posts/new", :type => :view do
  before(:each) do
    assign(:micro_post, MicroPost.new(
      :user_id => 1,
      :content => "MyText"
    ))
  end

  it "renders new micro_post form" do
    render

    assert_select "form[action=?][method=?]", micro_posts_path, "post" do

      assert_select "input#micro_post_user_id[name=?]", "micro_post[user_id]"

      assert_select "textarea#micro_post_content[name=?]", "micro_post[content]"
    end
  end
end
