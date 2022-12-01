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

<<<<<<< HEAD
  # def user_name
  #   "#{first_name} #{last_name}"
  # end

  has_one_attached :avatar

  validates :first_name, presence: true
  validates :last_name, presence: true

  after_commit :add_default_avatar, on: [:create, :update]

  private

  def add_default_avatar
    unless avatar.attached?
      avatar.attach(
        io: File.open(
          Rails.root.join(
            'app', 'assets', 'images', 'default_avatar.jpg'
          )
        ),
        filename: 'default_avatar.jpg',
        content_type: 'image/jpg'
      )
    end
  end
=======
>>>>>>> master
end
