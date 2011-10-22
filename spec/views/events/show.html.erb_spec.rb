require 'spec_helper'

describe "events/show.html.erb" do
  before(:each) do
    @user = FactoryGirl.create :user
    @event = assign(:event, stub_model(Event,
      :name => "Name",
      :location => "Location",
      :min_attendance => 1,
      :max_attendance => 1,
      :user => @user
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Location/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
  end
end
