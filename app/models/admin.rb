class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :name, presence: true, length: { minimum: 3 }
  validates :phone, length: { is: 10 }, presence: true
  validates :address, length: { maximum: 500 }, presence: true
  validates :email, length: { maximum: 250 }, presence: true
  validates :password, presence: true
  validates :password_confirmation, presence: true
end
