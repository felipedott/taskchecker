class TeamMember < ApplicationRecord
  belongs_to :team
  belongs_to :user
  validates :user, uniqueness: {
    scope: :team,
    message: "Is already on the team"
  }

  def user_name
    "#{user.first_name} #{user.last_name}"
  end
end
