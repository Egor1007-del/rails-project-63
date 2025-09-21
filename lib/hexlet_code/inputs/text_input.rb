# frozen_string_literal: true

module HexletCode
  module Inputs
    class TextInput < BaseInput
      TAG_NAME = 'textarea'

      COLS = '20'
      ROWS = '40'
      DEFAULT = { cols: COLS, rows: ROWS }.freeze

      def to_html
        value, default_value = extract_value_and_attrs
        attr = build_attr(default_value.merge(DEFAULT).except(:value, :type))
        build_tag(TAG_NAME, attr) { value }
      end
    end
  end
end
