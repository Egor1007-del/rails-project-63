module HexletCode
  class FormRender
    def self.rendering_html(form)
      form.body[:options].except(:method, :action, :inputs).each do |key, value| 
        @other_attr = [] << "#{key}=\"#{value}\""
      end
      
      puts "<form action=\"#{form.body[:options][:action]}\" method=\"#{form.body[:options][:method]}\" #{@other_attr.join}>\n\t#{render_tag(form).join("\n\t")}
</form>"
    end
       
    def self.render_tag(form)
      form.body[:inputs].map do |options|
        if options[:type].class == String
          HexletCode::Tag.build('input', options)
        else options[:type].class == Symbol
          value = options[:value]
          default_value = options.except(:value, :type).merge(cols: "20", rows: "40")
          HexletCode::Tag.build('textarea', default_value) { value }
        end
      end
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