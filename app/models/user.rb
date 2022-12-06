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

  has_many :events

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

    # DAQUI

    # user_params = auth.slice("provider", "uid")
    # user_params.merge! auth.info.slice("email", "first_name", "last_name")
    # user_params[:access_token] = auth.credentials.token
    # user_params[:expires_at] = Time.at(auth.credentials.expires_at)
    # user_params = user_params.to_h
    # # Finish creating the user params

    # # Find the user if there was a log in
    # user = User.find_by(provider: auth.provider, uid: auth.uid)

    # # If the User did a regular sign up in the past, find it
    # user ||= User.find_by(email: auth.info.email)
    # # If we had a user, update it
    # if user
    #   user.update(provider: auth.provider, uid: auth.uid)
    # # Else, create a new user with the params that come from the app callback
    # else
    #   user = User.new(user_params)
    #   # create a fake password for validation
    #   user.password = Devise.friendly_token[0,20]
    #   user.save
    # end

    #ATE AQUI

    user = User.where(provider: auth.try(:provider) || auth["provider"], uid: auth.try(:uid) || auth["uid"]).first
    if user
      return user
    else
      registered_user = User.where(provider: auth.try(:provider) || auth["provider"], uid: auth.try(:uid) || auth["uid"]).first || User.where(email: auth.try(:info).try(:email) || auth["info"]["email"]).first
      if registered_user
        unless registered_user.provider == (auth.try(:provider) || auth["provider"]) && registered_user.uid == (auth.try(:uid) || auth["provider"])
          registered_user.update_attributes(provider: auth.try(:provider) || auth["provider"], uid: auth.try(:uid) || auth["uid"])
        end
        return registered_user
      else
        user = User.new(:provider => auth.try(:provider) || auth["provider"], uid: auth.try(:uid) || auth["uid"])
        user.email = auth.try(:info).try(:email) || auth["info"]["email"]
        user.password = Devise.friendly_token[0,20]
        user.first_name = auth.info.name.split(" ")[0]
        user.last_name = auth.info.name.split(" ")[1]
        user.access_token = auth.credentials.token
        user.expires_at = auth.credentials.expires_at
        user.refresh_token = auth.credentials.refresh_token
        user.save
        puts user
      end
      user
    end
    # binding.pry

  end

  def expired?
    expires_at < Time.current.to_i
  end

  def name
    "#{self.first_name} #{self.last_name}"
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
