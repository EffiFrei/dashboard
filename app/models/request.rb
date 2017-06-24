class Request < ApplicationRecord
	belongs_to :carrier
	belongs_to :shipper

	validates :source, length: { minimum: 1 }, presence: true
	validates :destination, length: { minimum: 1 }, presence: true

	validates :poc_src, length: { minimum: 3 }, presence: true
	validates :poc_dest, length: { minimum: 3 }, presence: true
	validates :phone_src, length: { is: 10 }, presence: true
	validates :phone_dest, length: { is: 10 }, presence: true
	validates :email_src, presence: true
	validates :email_dest, presence: true
	validates :num_trucks, presence: true, numericality: { only_integer: true , greater_than: 0 }
	validates :service_lvl, presence: true
	validates :carrier_id, presence: true
	validates :shipper_id, presence: true
	validate  :reqd_date_in_the_future

	def reqd_date_in_the_future
		if reqd_date.present? && reqd_date < Date.today
			errors.add(:reqd_date, "can't be in the past")
		end
	end
end