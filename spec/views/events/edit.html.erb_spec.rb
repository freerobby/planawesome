require 'spec_helper'

describe "events/edit.html.erb" do
  before(:each) do
    @event = assign(:event, stub_model(Event,
      :name => "MyString",
      :location => "MyString",
      :min_attendance => 1,
      :max_attendance => 1
    ))
  end

  it "renders the edit event form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => events_path(@event), :method => "post" do
      assert_select "input#event_name", :name => "event[name]"
      assert_select "input#event_location", :name => "event[location]"
      assert_select "input#event_min_attendance", :name => "event[min_attendance]"
      assert_select "input#event_max_attendance", :name => "event[max_attendance]"
    end
  end
end
