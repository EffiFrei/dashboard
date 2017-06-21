class Truck < ApplicationRecord
	belongs_to :carrier

	validates :registration_num, presence: true
	validates :engine_num, presence: true
	validates :chasis_num, presence: true
	validates :manufacturer, presence: true
	validates :model, presence: true
	validates :load_capacity, presence: true
end
