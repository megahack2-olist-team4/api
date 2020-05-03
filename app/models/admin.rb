class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :registerable, :timeoutable, :trackable, :validatable and :omniauthable
  devise :database_authenticatable, :recoverable, :rememberable
end
