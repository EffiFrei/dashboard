class Shipper < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :name, length: { minimum: 3 }
  validates :poc, length: { minimum: 3 }
  validates :phone, length: { is: 10 }
  validates :PAN, length: { is: 10 }
  validates :CIN, length: { is: 21 }
end
