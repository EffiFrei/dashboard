class Carrier < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :trucks

  validates :name, length: { minimum: 3 }
  validates :owner_name, length: { minimum: 3 }
  validates :PoC, length: { minimum: 3 }
  validates :address, length: { maximum: 500 }
  validates :phone, length: { is: 10 }
  validates :PAN, length: { is: 10 }
  validates :CIN, length: { is: 21 }

end