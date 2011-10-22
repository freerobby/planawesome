require 'spec_helper'

describe User do
  describe "#create_with_omniauth" do
    it "creates user using auth data" do
      User.destroy_all
      User.count.should == 0
      auth = {
        "provider" => "some_provider",
        "uid" => "some_uid",
        "user_info" => {
          "name" => "some_name"
        }
      }
      User.create_with_omniauth(auth)
      User.count.should == 1
      User.first.provider.should == "some_provider"
      User.first.uid.should == "some_uid"
      User.first.name.should == "some_name"
    end
  end
end
