class User < ActiveRecord::Base
    has_secure_password
    has_one :profile
    has_many :lists, class_name: "List", foreign_key: "owner_id"
    has_many :animes, through: :lists
    validates :user_name, :email, presence: true, uniqueness: true
end