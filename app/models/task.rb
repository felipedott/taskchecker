class Task < ApplicationRecord
  has_many :subtasks

  # belongs_to :team -> as linhas abaixo ja deixam isso implicito

  belongs_to :manager, class_name: 'User'
  belongs_to :member, class_name: 'User'
  belongs_to :team

  validates :name, presence: true
  validates :description, presence: true
  validates :member_id, presence: true
  # validates :completed, presence: true

  # has_and_belongs_to_many :users
end
