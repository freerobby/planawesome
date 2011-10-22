require 'spec_helper'

describe "users/edit.html.erb" do
  before(:each) do
    @user = assign(:user, stub_model(User,
      :provider => "MyString",
      :uid => "MyString",
      :name => "MyString"
    ))
  end

  it "renders the edit user form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => users_path(@user), :method => "post" do
      assert_select "input#user_provider", :name => "user[provider]", :count => 0
      assert_select "input#user_uid", :name => "user[uid]", :count => 0
      assert_select "input#user_name", :name => "user[name]"
    end
  end
end
