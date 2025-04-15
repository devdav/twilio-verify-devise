# frozen_string_literal: true

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :twilio_verify_authenticatable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
