class Team < ApplicationRecord
  has_many :team_members, dependent: :destroy
  has_many :users, through: :team_members
  has_many :tasks
  has_one  :chatroom, dependent: :destroy
  validates :name, presence: true
end
