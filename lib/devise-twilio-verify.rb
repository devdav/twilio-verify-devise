require 'active_support/concern'
require 'active_support/core_ext/integer/time'
require 'devise'

module Devise
  mattr_accessor :twilio_verify_remember_device
  @@twilio_verify_remember_device = 1.month
end

module DeviseTwilioVerify
  autoload :Mapping, 'devise-twilio-verify/mapping'

  module Controllers
    autoload :Passwords, 'devise-twilio-verify/controllers/passwords'
    autoload :Helpers, 'devise-twilio-verify/controllers/helpers'
  end
end

require 'devise-twilio-verify/routes'
require 'devise-twilio-verify/rails'
require 'devise-twilio-verify/models/twilio_verify_authenticatable'
require 'devise-twilio-verify/models/twilio_verify_lockable'
require 'devise-twilio-verify/version'

Devise.add_module :twilio_verify_authenticatable, :model => 'devise-twilio-verify/models/twilio_verify_authenticatable', :controller => :devise_twilio_verify, :route => :twilio_verify
Devise.add_module :twilio_verify_lockable,        :model => 'devise-twilio-verify/models/twilio_verify_lockable'
