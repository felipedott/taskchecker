class Task < ApplicationRecord
  has_many :subtasks
  belongs_to :member, class_name: 'User'
  belongs_to :manager, class_name: 'User'
end
