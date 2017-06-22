class Driver < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :truck

  validates :DL, length: { is: 15 }, presence: true
  validates :name, length: { minimum: 3 }, presence: true
  validates :phone, length: { is: 10 }, presence: true
end
