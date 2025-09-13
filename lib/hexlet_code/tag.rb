# frozen_string_literal: true

module HexletCode
  class Tag
    def self.build(tag, attr = {})
      attributes = build_attr(attr)
      return "<#{tag}#{attributes}>" if %w[br img input].include?(tag)

      block = block_given? ? yield : ''
      "<#{tag}#{attributes}>#{block}</#{tag}>"
    end

    def self.build_attr(attr = {})
      return '' if attr.empty?

      pair_attr = []
      attr.map do |key, value|
        pair_attr << "#{key}=\"#{value}\""
      end
      pair_attr.join(' ').prepend(' ')
    end
  end
end

# puts HexletCode::Tag.build('label', for: 'email') { 'Email' }
