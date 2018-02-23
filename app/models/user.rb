class User < ApplicationRecord
	extend Devise::Models

	has_many :inicio, dependent: :destroy
	has_many :messages, dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

         def name
         	email.split('@')[0]
         end
end
