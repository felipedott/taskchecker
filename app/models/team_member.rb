class TeamMember < ApplicationRecord
  belongs_to :team
  belongs_to :user

  def user_name
    "#{user.first_name} #{user.last_name}"
  end


end
