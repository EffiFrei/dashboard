class Request < ApplicationRecord
	validates :source, length: { minimum: 1 }
	validates :destination, length: { minimum: 1 }
	validates :poc_src, length: { minimum: 3 }
	validates :poc_dest, length: { minimum: 3 }
	validates :phone_src, length: { is: 10 }
	validates :phone_dest, length: { is: 10 }
end
