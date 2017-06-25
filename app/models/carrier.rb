class Carrier < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :trucks
  has_many :drivers, through: :trucks
  has_many :requests, through: :trucks

  validates :name, length: { minimum: 3 }, allow_nil: true
  validates :owner_name, length: { minimum: 3 }, allow_nil: true
  validates :PoC, length: { minimum: 3 }, allow_nil: true
  validates :address, length: { maximum: 500 }, allow_nil: true
  validates :phone, length: { is: 10 }, allow_nil: true
  validates :PAN, length: { is: 10 }, allow_nil: true
  validates :CIN, length: { is: 21 }, allow_nil: true
  validates :email, presence: true
  validates :password, presence: true
  validates :password_confirmation, presence: true
end