# frozen_string_literal: true

lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "devise-twilio-verify/version"

Gem::Specification.new do |spec|
  spec.name          = "devise-twilio-verify"
  spec.version       = DeviseTwilioVerify::VERSION
  spec.authors       = ["David Edwards"]
  spec.email         = ["david@clubworx.com"]

  spec.summary       = %q{A fork of authy-devise that uses the Twilio Verify API.}
  spec.description   = %q{A fork of authy-devise that uses the Twilio Verify API.}
  spec.homepage      = "https://github.com/devdav/twilio-verify-devise"
  spec.license       = "MIT"

  spec.metadata      = {
    "bug_tracker_uri"   => "https://github.com/devdav/twilio-verify-devise/issues",
    "change_log_uri"    => "https://github.com/devdav/twilio-verify-devise/blob/master/CHANGELOG.md",
    "documentation_uri" => "https://github.com/devdav/twilio-verify-devise",
    "homepage_uri"      => "https://github.com/devdav/twilio-verify-devise",
    "source_code_uri"   => "https://github.com/devdav/twilio-verify-devise"
  }

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.require_paths = ["lib"]

  spec.add_dependency "devise", ">= 4.0.0"

  spec.add_development_dependency "bundler", ">= 1.16"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "combustion", "~> 1.1"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "rspec-rails"
  spec.add_development_dependency "rails-controller-testing", "~> 1.0"
  spec.add_development_dependency "yard", "~> 0.9.11"
  spec.add_development_dependency "rdoc", "~> 4.3.0"
  spec.add_development_dependency "simplecov", "~> 0.17.1"
  spec.add_development_dependency "webmock", "~> 3.11.0"
  spec.add_development_dependency "rails", ">= 5"
  spec.add_development_dependency "sqlite3"
  spec.add_development_dependency "generator_spec"
  spec.add_development_dependency "database_cleaner", "~> 1.7"
  spec.add_development_dependency "factory_bot_rails", "~> 5.1.1"
end
