class Animelist < ActiveRecord::Base
    belongs_to :anime
    belongs_to :list
end