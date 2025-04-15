# frozen_string_literal: true

FactoryBot.define do
  sequence :email do |n|
    "person#{n}@example.com"
  end

  factory :user do
    email { generate(:email) }
    password { "correct horse battery staple" }

    factory :twilio_verify_user do
      twilio_verify_mfa_enabled { true }
    end
  end

  factory :lockable_user, class: LockableUser do
    email { generate(:email) }
    password { "correct horse battery staple" }
  end

  factory :lockable_twilio_verify_user, class: LockableUser do
    email { generate(:email) }
    password { "correct horse battery staple" }
    twilio_verify_mfa_enabled { true }
  end
end