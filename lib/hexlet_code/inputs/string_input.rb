# frozen_string_literal: true

module HexletCode
  module Inputs
    class StringInput < BaseInput
      TAG_NAME = 'input'
      DEFAULT = {}.freeze

      def to_html
        value, default_value = extract_value_and_attrs
        attr = build_attr(default_value.merge(value: value))
        attr[:type] = 'text'
        build_tag(TAG_NAME, attr)
      end
    end
  end
end
