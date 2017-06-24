module AdminsHelper
	class Admin::ParameterSanitizer < Devise::ParameterSanitizer
		def initialize(*)
			super
			permit(:sign_up, keys: [:email, :name, :phone])
		end
	end
end
