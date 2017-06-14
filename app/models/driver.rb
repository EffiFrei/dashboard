class Driver < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :DL, length: { is: 15 }
  validates :name, length: { minimum: 3 }
  validates :phone, length: { is: 10 }
end
