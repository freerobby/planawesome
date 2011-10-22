require 'spec_helper'

describe SessionsController do
  describe "#create" do
    before do
      request.env["omniauth.auth"] = {
        "provider" => "some_provider",
        "uid" => "some_uid",
        "user_info" => {
          "name" => "some_name"
        }
      }
    end
    describe "user exists" do
      before do
        @user = User.create! "provider" => "some_provider", "uid" => "some_uid"
      end
      it "logs the user in" do
        session[:user_id].should_not == @user.id
        post :create
        session[:user_id].should == @user.id
      end
    end
    describe "user does not exist" do
      before do
        User.destroy_all
      end
      it "creates user and logs him in" do
        post :create
        User.count.should == 1
        User.first.provider.should == "some_provider"
        User.first.uid.should == "some_uid"
        User.first.name.should == "some_name"
        session[:user_id].should == User.first.id
      end
    end
  end
end
