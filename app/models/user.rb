class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         # for Google OmniAuth
         :omniauthable, omniauth_providers: [:google_oauth2]

  has_many :tasks_as_manager, class_name: 'Task', foreign_key: :manager_id
  has_many :tasks_as_member, class_name: 'Task', foreign_key: :member_id

  # has_and_belongs_to_many :tasks

  has_many :teams, through: :team_members
  has_many :team_members # JOIN TABLE

  has_one_attached :avatar

  validates :first_name, presence: true
  validates :last_name, presence: true

  after_commit :add_default_avatar, on: [:create, :update]

  def self.from_omniauth(auth)
    # where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
    #   user.email = auth.info.email
    #   user.password = Devise.friendly_token[0, 20]
    #   user.first_name = auth.info.first_name # assuming the user model has a name
    #   user.last_name = auth.info.last_name
    # end
    # binding.pry
    user_params = auth.slice("provider", "uid")
    user_params.merge! auth.info.slice("email", "first_name", "last_name")

    # Finish creating the user params

    # Find the user if there was a log in
    user = User.find_by(provider: auth.provider, uid: auth.uid)

    # If the User did a regular sign up in the past, find it
    user ||= User.find_by(email: auth.info.email)

    # If we had a user, update it
    if user
      user.update(provider: auth.provider, uid: auth.uid)
    # Else, create a new user with the params that come from the app callback
    else
      user = User.new(email: auth.info.email, first_name: auth.info.first_name, last_name: auth.info.last_name, provider: auth.provider, uid: auth.uid)
      # create a fake password for validation
      user.password = Devise.friendly_token[0,20]
      user.save
    end

    return user
  end

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
end
