class User < ActiveRecord::Base
  has_many :rounds

  def self.all
    [User.new]
  end
end
