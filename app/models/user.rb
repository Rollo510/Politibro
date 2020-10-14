class User < ApplicationRecord
    has_many :comments
    has_many :memes, through: :comments
    devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable, :omniauthable, :omniauth_providers => [:facebook]

  def create_facebook_username
    if !current_user.username.exist
      email = current_user.email
      current_user.username = email[/[^@]+/]
    end
  end

  def self.from_omniauth(auth)
      where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
    end    
  end




end
