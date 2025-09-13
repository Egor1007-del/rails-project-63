# frozen_string_literal: true

require_relative '../lib/hexlet_code'

RSpec.configure do |config|
  config.add_setting :fixture_path, default: File.expand_path('fixtures', __dir__)
end

def fixture_path
  RSpec.configuration.fixture_path
end

def read_fixture(name, mode: 'r:UTF-8')
  File.open(File.join(fixture_path, name), mode, &:read)
end
# def load_fixture(path)
#     path = File.join(File.dirname(__FILE__), "./fixtures/#{path}")
#     File.open(path).read
# end

# $LOAD_PATH.unshift File.expand_path('../lib', __dir__)
# require 'hexlet_code'
