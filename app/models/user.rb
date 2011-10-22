class User < ActiveRecord::Base
  has_many :events
  
  def user_id # For ownership checking of self
    self.id
  end
  
  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.name = auth["user_info"]["name"]
    end
  end
end
