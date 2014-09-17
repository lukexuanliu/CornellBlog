require 'rails_helper'

RSpec.describe "users/index", :type => :view do
  before(:each) do
    assign(:users, [
      User.create!(
        :name => "Name",
        :email => "E@mail.com"
      ),
      User.create!(
        :name => "Name",
        :email => "E2@mail.com"
      )
    ])
  end

  it "renders a list of users" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "E@mail.com".to_s, :count => 1
    assert_select "tr>td", :text => "E2@mail.com".to_s, :count => 1
  end
end
