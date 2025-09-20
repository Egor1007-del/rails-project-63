module HexletCode
  module Inputs
    class BaseInput
		
			TAG_NAME = nil
			DEFAULT = {}.freeze
			STRIP_KEY = %i[type label count].freeze

			def initialize(options)
				@options = options
			end

			# def to_html
			# end

			def extract_value_and_attrs
				value = @options[:value]
				default_value = @options.reject { |key, n| STRIP_KEY.include?(key) }

				[value, default_value]
			end

			def build_attr(custom_attr)
				DEFAULT.merge(custom_attr)
			end
			
			def build_tag(tag_name, attr, &block)
				HexletCode::Tag.build(tag_name, attr, &block)
			end
    end
  end
end
