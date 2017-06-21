class Shipper < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :name, length: { minimum: 3 }, presence: true
  validates :poc, length: { minimum: 3 }, presence: true
  validates :phone, length: { is: 10 }, presence: true
  validates :PAN, length: { is: 10 }, presence: true
  validates :CIN, length: { is: 21 }, presence: true
end
