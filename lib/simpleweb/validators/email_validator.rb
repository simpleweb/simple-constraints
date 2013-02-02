module Simpleweb
  module Validators
    class EmailValidator < ActiveModel::EachValidator

      def validate_each(record, attribute, value)
        return if value.blank?

        unless value =~ /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i
          message = options[:message] || 'is not valid'
          record.errors[attribute] << message
        end
      end

    end
  end
end
