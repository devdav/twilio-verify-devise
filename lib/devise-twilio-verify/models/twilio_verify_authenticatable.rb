require 'devise-twilio-verify/hooks/twilio_verify_authenticatable'
module Devise
  module Models
    module TwilioVerifyAuthenticatable
      extend ActiveSupport::Concern

      def with_twilio_verify_authentication?(request)
        if self.twilio_verify_mfa_enabled
          return true
        end

        return false
      end

      module ClassMethods
        Devise::Models.config(self, :twilio_verify_remember_device)
      end
    end
  end
end

