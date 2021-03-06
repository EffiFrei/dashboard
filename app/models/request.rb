class Request < ApplicationRecord
	belongs_to :shipper
	belongs_to :truck

	validates :source, length: { minimum: 1 }, presence: true
	validates :destination, length: { minimum: 1 }, presence: true

	validates :poc_src, length: { minimum: 3 }, presence: true
	validates :poc_dest, length: { minimum: 3 }, presence: true
	validates :phone_src, length: { is: 10 }, presence: true
	validates :phone_dest, length: { is: 10 }, presence: true
	validates :email_src, presence: true
	validates :email_dest, presence: true

	validates :num_trucks, presence: true, numericality: { only_integer: true , greater_than: 0 }

	validates :shipper_id, presence: true
	validates :truck_id, presence: true

	validates :load_weight, presence: true
	validate  :reqd_date_in_the_future

	def reqd_date_in_the_future
		if reqd_date.present? && reqd_date < Date.today
			errors.add(:reqd_date, "can't be in the past")
		end
	end

	def shipper_data
		Shipper.find(self.shipper_id)
	end

	def truck_data
		Truck.find(self.truck_id)
	end
end