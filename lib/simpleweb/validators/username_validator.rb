module Simpleweb
  module Validators
    class UsernameValidator < ActiveModel::EachValidator
      def validate_each(record, attribute, value)
        return if value.blank?

        unless value =~ /^[a-z0-9\-_]+$/
          message = options[:message] || 'is not valid - only letters, numbers, hyphens and underscores are allowed'
          record.errors[attribute] << message
        end
      end
    end
  end
end
