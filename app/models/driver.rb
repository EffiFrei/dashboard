class Driver < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :truck

  validates :DL, length: { is: 15 }, presence: true
  validates :name, length: { minimum: 3 }, presence: true
  validates :phone, length: { is: 10 }, presence: true

  def truck_data
  	Truck.find(self.truck_id)
  end

  def carrier_data
  	Carrier.find(self.truck.carrier_id)
  end
end
