class List < ActiveRecord::Base
    belongs_to :owner, class_name: "User"
    has_many :animelists
    has_many :animes, through: :animelists
    validates :name, presence: true
end