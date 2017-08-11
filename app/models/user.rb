require 'bcrypt'

class User < ActiveRecord::Base
  include BCrypt

  has_many :rounds

  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true

  def password
    @password ||= BCrypt::Password.new(encrypted_password)
  end

  def password=(new_password)
    @password = BCrypt::Password.create(new_password)
    self.encrypted_password = @password
  end

  def self.authenticate(username,plain_text_password)
    user = self.find_by(username: username)
    return user if user && user.password == plain_text_password
  end
end
