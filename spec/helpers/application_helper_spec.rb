require 'spec_helper'

describe ApplicationHelper do
  describe "#is_owner?" do
    it "true on user match" do
      user = FactoryGirl.create(:user)
      event = FactoryGirl.create(:event, :user => user)
      login(user)
      helper.is_owner?(event).should be_true
    end
    it "false on mismatch" do
      user = FactoryGirl.create(:user)
      event = FactoryGirl.create(:event, :user => user)
      user2 = FactoryGirl.create(:user)
      login(user2)
      helper.is_owner?(event).should be_false
    end
    it "false on logout" do
      user = FactoryGirl.create(:user)
      event = FactoryGirl.create(:event, :user => user)
      logout
      helper.is_owner?(event).should be_false
    end
  end
end
