module HexletCode
  module Inputs
    class TextInput < BaseInput
      TAG_NAME = 'textarea'.freeze

      COLS = '20'
      ROWS = '40'
      DEFAULT = { cols: COLS, rows: ROWS }

      def to_html
        value, default_value = extract_value_and_attrs
        attr = build_attr(default_value.reject { |key, _n| key == :value }).merge(DEFAULT).except(:type)
        build_tag(TAG_NAME, attr) { value }
      end
    end
  end
end
