class User < ActiveRecord::Base
    has_secure_password
    has_many :lists
    has_many :animes, through: :lists
    validates :user_name, :email, presence: true, uniqueness: true
end