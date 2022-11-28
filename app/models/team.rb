class Team < ApplicationRecord
  belongs_to :user
  has_many :team_members
end
