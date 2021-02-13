class Anime < ActiveRecord::Base
    belongs_to :user
    has_many :animelists
    has_many :lists, through: :animelists
    validates :name, presence: true
end