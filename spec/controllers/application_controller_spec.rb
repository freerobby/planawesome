require 'spec_helper'

describe ApplicationController do
  describe "helper methods" do
    describe "#current_user" do
      it "returns nil if no user signed in" do
        session[:user_id] = nil
        controller.send(:current_user).should be_nil
      end
      it "returns user if signed in" do
        user = FactoryGirl.create(:user)
        session[:user_id] = user.id
        controller.send(:current_user).should == user
      end
    end
    describe "#logged_in?" do
      it "returns true if a user is logged in" do
        user = FactoryGirl.create(:user)
        session[:user_id] = user.id
        controller.send(:logged_in?).should be_true
      end
      it "returns false if no user logged in" do
        session[:user_id] = nil
        controller.send(:logged_in?).should be_false
      end
    end
  end
end
