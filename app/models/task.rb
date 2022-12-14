class Task < ApplicationRecord
  has_many :subtasks

  belongs_to :manager, class_name: 'User'
  belongs_to :member, class_name: 'User'
  belongs_to :team

  validates :name, presence: true
  validates :description, presence: true
  validates :member_id, presence: true
end
