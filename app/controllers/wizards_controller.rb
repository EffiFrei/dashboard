class WizardsController < ApplicationController
	before_action :load_request_wizard, except: %i(validate_step)

	def validate_step
		current_step = params[:current_step]

		@request_wizard = wizard_request_for_step(current_step)
		@request_wizard.request.attributes = request_wizard_params
		session[:request_attributes] = @request_wizard.request.attributes

		if @request_wizard.valid?
			next_step = wizard_request_next_step(current_step)
			create and return unless next_step

			redirect_to action: next_step
		else
			render current_step
		end
	end

	def create
		if @request_wizard.request.save
			session[:request_attributes] = nil
			redirect_to root_path, notice: 'Request succesfully created!'
		else
			redirect_to({ action: Wizard::Request::STEPS.first }, alert: 'There were a problem when creating the request.')
		end
	end

	private

	def load_request_wizard
		@request_wizard = wizard_request_for_step(action_name)
	end

	def wizard_request_next_step(step)
		Wizard::Request::STEPS[Wizard::Request::STEPS.index(step) + 1]
	end

	def wizard_request_for_step(step)
		raise InvalidStep unless step.in?(Wizard::Request::STEPS)

		"Wizard::Request::#{step.camelize}".constantize.new(session[:request_attributes])
	end

	def request_wizard_params
		params.require(:request_wizard).permit(
			:source,
			:destination,
			:num_trucks,
			:reqd_date,
			:poc_src,
			:poc_dest,
			:email_src,
			:email_dest,
			:phone_src,
			:phone_dest,
			:truck_id,
			:shipper_id,
			:load_weight)
	end

	class InvalidStep < StandardError; end
end
