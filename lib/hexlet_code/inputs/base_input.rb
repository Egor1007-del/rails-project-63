# frozen_string_literal: true

module HexletCode
  module Inputs
    class BaseInput
      TAG_NAME = nil
      DEFAULT = {}.freeze
      STRIP_KEY = %i[label count].freeze

      def initialize(options)
        @options = options
      end

      def extract_value_and_attrs
        value = @options[:value]
        default_value = @options.except(*STRIP_KEY)

        [value, default_value]
      end

      def build_attr(custom_attr)
        DEFAULT.merge(custom_attr)
      end

      def build_tag(tag_name, attr, ...)
        HexletCode::Tag.build(tag_name, attr, ...)
      end
    end
  end
end
