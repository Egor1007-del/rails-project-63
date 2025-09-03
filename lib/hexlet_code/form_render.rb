# frozen_string_literal: true

module HexletCode
  class FormRender
    def self.rendering_html(form)
      @form = form

      "<form action=\"#{action}\" method=\"#{method}\"#{other_attr}>\n\t#{render_tag_input}\n\t#{render_tag_submit}
</form>"
    end

    def self.method
      @form.body[:form_attributes][:method]
    end

    def self.action
      @form.body[:form_attributes][:action]
    end

    def self.other_attr(other_attr = nil)
      @form.body[:form_attributes].except(:method, :action, :inputs).each do |key, value|
        other_attr = [] << " #{key}=\"#{value}\""
      end
      other_attr&.join
    end

    def self.render_tag_input
      return '' if @form.body[:inputs].empty?

      input = []
      @form.body[:inputs].map do |options|
        if options[:type].is_a? String
          if options[:count] == 1
            tag_for = options[:label].except(:content)
            content = options[:label][:content]
            input << HexletCode::Tag.build('label', tag_for) { content }
          end
          tag_attr = options.except(:label, :count)
          input << HexletCode::Tag.build('input', tag_attr)

        elsif options[:type].is_a? Symbol
          if options[:count] == 1
            tag_for = options[:label].except(:content)
            content = options[:label][:content]
            input << HexletCode::Tag.build('label', tag_for) { content }
          end
          value = options[:value]
          default_value = options.except(:value, :type, :label, :count).merge(cols: '20', rows: '40')
          input << HexletCode::Tag.build('textarea', default_value) { value }
        end
      end
      input.join("\n\t")
    end

    def self.render_tag_submit
      return '' if @form.body[:submit].empty?

      submit = []
      @form.body[:submit].map do |options|
        tag_attr = options.except(:label)
        submit << HexletCode::Tag.build('input', tag_attr)
      end
      submit.join("\n\t")
    end
  end
end

# User = Struct.new(:name, :job)
# user = User.new name: 'rob'

# puts FormRender.form_for user, url: '/profile', class: 'hexlet-form' do |f|
# end

# class << self
#       def form_for(user, attributes = {})
#         if attributes.empty?
#           "<form action=\"#\" method=\"post\"></form>"
#         else
#           pair_attr = []
#           url = []
#           attributes.each do |key, value|
#             next url = value if key == :url
#             pair_attr << "#{key}=\"#{value}\""
#           end
#           pair_attr = pair_attr.join(' ')
#           if url.empty?
#             "<form action=\"#\" method=\"post\" #{pair_attr}></form>"
#           else
#             "<form action=\"#{url}\" method=\"post\" #{pair_attr}></form>"
#           end
#         end
#       end
#     end
