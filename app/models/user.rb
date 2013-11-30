class User < ActiveRecord::Base
  validates_presence_of :email, :password

  devise :database_authenticatable, :registerable, :confirmable, :recoverable,
  :rememberable, :trackable, :validateable, :token_authenticatable

  before_save :ensure_authentication_token

end