class Team < ApplicationRecord
  has_many :team_members, dependent: :destroy
  has_many :users, through: :team_members
  has_many :tasks
  has_one  :chatroom, dependent: :destroy
  validates :name, presence: true
  after_create :create_team_chat

  # CREATES A CHAT WHEN YOU CREATE A TEAM
  def create_team_chat
    Chatroom.create(name: self.name, team: self)
  end
end
