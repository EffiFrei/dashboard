module Wizard
  module Request
    STEPS = %w(step1 step2 step3 step4).freeze

    class Base
      include ActiveModel::Model
      attr_accessor :request

      delegate *::Request.attribute_names.map { |attr| [attr, "#{attr}="] }.flatten, to: :request

      def initialize(request_attributes)
        @request = ::Request.new(request_attributes)
      end
    end

    class Step1 < Base
      validates :source, length: { minimum: 1 }, presence: true
      validates :carrier_id, presence: true
      validates :shipper_id, presence: true
    end

    class Step2 < Step1
			validates :destination, length: { minimum: 1 }, presence: true
    end

    class Step3 < Step2
			validates :phone_src, length: { is: 10 }, presence: true
			validates :phone_dest, length: { is: 10 }, presence: true
    end

    class Step4 < Step3
			validates :poc_src, length: { minimum: 3 }, presence: true
			validates :poc_dest, length: { minimum: 3 }, presence: true
    end
  end
end
