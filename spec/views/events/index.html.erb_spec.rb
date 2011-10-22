require 'spec_helper'

describe "events/index.html.erb" do
  before(:each) do
    @user = FactoryGirl.create :user
    assign(:events, [
      stub_model(Event,
        :name => "Name",
        :location => "Location",
        :min_attendance => 1,
        :max_attendance => 5,
        :user => @user
      ),
      stub_model(Event,
        :name => "Name",
        :location => "Location",
        :min_attendance => 1,
        :max_attendance => 5,
        :user => @user
      )
    ])
  end

  it "renders a list of events" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Location".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 5.to_s, :count => 2
  end
end
