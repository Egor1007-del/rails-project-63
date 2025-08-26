module HexletCode
  class Tag
    def self.build(tag, attr = {})
      attributes = build_attr(attr) 
      return "<#{tag}#{attributes}>" if %w[br img input].include?(tag)
      block_given? ? block = yield : block = ''
      "<#{tag}#{attributes}>#{block}</#{tag}>"
    end

    def self.build_attr(attr = {})
      return '' if attr.empty? 

      pair_attr = []
      attr.each do |key, value| 
        pair_attr << "#{key}=\"#{value}\""
      end
      pair_attr.join(' ').prepend(' ')
    end
  end
end

# puts HexletCode::Tag.build('label', for: 'email') { 'Email' }