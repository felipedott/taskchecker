class Task < ApplicationRecord
  has_many :subtasks

  # belongs_to :team -> as linhas abaixo ja deixam isso implicito
  belongs_to :member, class_name: 'User'
  belongs_to :manager, class_name: 'User'
end
