class Inicio < ApplicationRecord
  belongs_to :user
  has_many :messages, dependent: :destroy
  
end
