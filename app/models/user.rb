require 'bcrypt'

class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :lockable, :timeoutable

  has_many :cars, as: :owner, dependent: :destroy
  has_many :vendors, as: :venderable, dependent: :destroy

  has_many :user_groups
  has_many :groups, through: :user_groups

  mount_uploader :avatar, AvatarUploader

  EMAIL_REGEX = /\A[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}\z/i

  validates_presence_of :email, :username, :first_name, :last_name
  validates_uniqueness_of :username, :email

  validates_format_of :email, with: EMAIL_REGEX

  class << self
    def authenticate(username_or_email, login_password)
      if EMAIL_REGEX.match(username_or_email)
        user = User.find_by_email(username_or_email)
      else
        user = User.find_by_username(username_or_email)
      end

      if user && user.valid_password?(login_password)
        user
      else
        false
      end
    end
  end
end
