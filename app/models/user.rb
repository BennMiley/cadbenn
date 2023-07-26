class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
        :rememberable, :validatable

        has_many :tweets

 def self.ransackable_attributes(auth_object = nil)
  ["admin", "created_at", "email", "id", "remember_created_at", "reset_password_sent_at", "reset_password_token", "updated_at"]
end
end