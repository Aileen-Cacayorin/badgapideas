class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, omniauth_providers: [:google_oauth2]


  def self.find_for_google_oauth2(access_token, signed_in_resource = nil)
    if access_token.info.email.end_with?('@gapintelligence.com')
      user = User.create_with(first_name: access_token.info.first_name, last_name: access_token.info.last_name, password: Devise.friendly_token[0, 20]).find_or_create_by(email: access_token.info.email)

      user
    end
  end
end
