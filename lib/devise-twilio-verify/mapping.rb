module DeviseTwilioVerify
  module Mapping
    private
    def default_controllers(options)
      options[:controllers] ||= {}
      options[:controllers][:passwords] ||= "devise_twilio_verify/passwords"
      super
    end
  end
end
