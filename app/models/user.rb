class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :tasks_as_manager, class_name: 'Task', foreign_key: :manager_id
  has_many :tasks_as_member, class_name: 'Task', foreign_key: :member_id

  # has_and_belongs_to_many :tasks

  has_many :teams, through: :team_members
  has_many :team_members # JOIN TABLE

  # def user_name
  #   "#{first_name} #{last_name}"
  # end

end
