class Task < ApplicationRecord
  has_many :subtasks

  # belongs_to :team -> as linhas abaixo ja deixam isso implicito

  belongs_to :manager, class_name: 'TeamMember'
  belongs_to :member, class_name: 'TeamMember'

  validates :name, presence: true
  validates :description, presence: true
  validates :member_id, presence: true

end
