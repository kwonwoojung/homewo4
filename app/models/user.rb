class User < ActiveRecord::Base
  rolify
    has_secure_password
    has_many :contents
    validates_uniqueness_of :email ,:nickname

    # validates :email, uniqueness: true
end
