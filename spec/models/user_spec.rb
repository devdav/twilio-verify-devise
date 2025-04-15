# frozen_string_literal: true

RSpec.describe User, type: :model do
  let!(:user) { create(:user) }

  describe "user#with_twilio_verify_authentication?" do
    it "should be false regardless of twilio_verify_mfa_enabled field" do
      request = double("request")
      expect(user.with_twilio_verify_authentication?(request)).to be false
      user.twilio_verify_mfa_enabled = true
      expect(user.with_twilio_verify_authentication?(request)).to be false
    end
  end
end