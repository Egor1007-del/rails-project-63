# frozen_string_literal: true

require_relative "hexlet_code/version"

module HexletCode
  class Error < StandardError; end
    class Tag; end
      class << self
        def build(*arr, &block)
          case arr[0]
          when "div"
            puts "<#{arr[0]}></#{arr[0]}>"
          when "img"
            arr[1].map do |key, value|
              puts "<#{arr[0]} #{key}=\"#{value}\">"
            end
          when "input"
            params = []
            arr[1].map do |key, value|
              params << "#{key}=\"#{value}\""
            end
            puts "<#{arr[0]} #{params[0]} #{params[1]}>"
          when "label"
            puts "<#{arr[0]}>#{block.call}</#{arr[0]}>"
          end
        end
      end
end
