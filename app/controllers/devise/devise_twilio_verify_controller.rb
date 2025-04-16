class Devise::DeviseTwilioVerifyController < DeviseController
  prepend_before_action :find_resource_and_require_password_checked, :only => [
    :GET_verify_twilio_verify, :POST_verify_twilio_verify
  ]

  prepend_before_action :authenticate_scope!, :only => [
    :POST_enable_twilio_verify, :POST_disable_twilio_verify
  ]

  include Devise::Controllers::Helpers

  def GET_verify_twilio_verify
    raise NotImplementedError
  end

  # verify 2fa
  def POST_verify_twilio_verify
    raise NotImplementedError
  end

  def POST_enable_twilio_verify
    raise NotImplementedError
  end

  # Disable 2FA
  def POST_disable_twilio_verify
    raise NotImplementedError
  end

  private

  def authenticate_scope!
    send(:"authenticate_#{resource_name}!", :force => true)
    self.resource = send("current_#{resource_name}")
    @resource = resource
  end

  def find_resource
    @resource = send("current_#{resource_name}")

    if @resource.nil?
      @resource = resource_class.find_by_id(session["#{resource_name}_id"])
    end
  end

  def find_resource_and_require_password_checked
    find_resource

    if @resource.nil? || session[:"#{resource_name}_password_checked"].to_s != "true"
      redirect_to invalid_resource_path
    end
  end

  protected

  def after_twilio_verify_enabled_path_for(resource)
    root_path
  end

  def after_twilio_verify_verified_path_for(resource)
    after_twilio_verify_enabled_path_for(resource)
  end

  def after_twilio_verify_disabled_path_for(resource)
    root_path
  end

  def invalid_resource_path
    root_path
  end

  def after_account_is_locked
    sign_out_and_redirect @resource
  end

  def remember_user
    if session.delete("#{resource_name}_remember_me") == true && @resource.respond_to?(:remember_me=)
      @resource.remember_me = true
    end
  end
end
