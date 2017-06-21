class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :name, presence: true, length: { minimum: 3 }, presence: true
  validates :phone, length: { is: 10 }, presence: true
  validates :address, length: { maximum: 500 }, presence: true
end
