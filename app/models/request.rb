class Request < ApplicationRecord
	validates :source, length: { minimum: 1 }, presence: true
	validates :destination, length: { minimum: 1 }, presence: true
	validates :poc_src, length: { minimum: 3 }, presence: true
	validates :poc_dest, length: { minimum: 3 }, presence: true
	validates :phone_src, length: { is: 10 }, presence: true
	validates :phone_dest, length: { is: 10 }, presence: true
end
