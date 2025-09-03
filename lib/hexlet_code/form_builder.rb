module HexletCode
  class FormBuilder
    attr_accessor :body
    def initialize(user, **attr)
      @user = user
      action = attr.fetch(:url, '#') 
      method = attr.fetch(:method, 'post') 
      @body = { inputs: [],
                submit: [],
                form_attributes: { action:, method: }.merge(attr.except(:url, :method))
      }
    end

    def input(name, attr = {})
      @body[:inputs] << build_input_attr(name, attr).merge(count: 1)
    end

    def submit(value = "Save", attr = {})
      @body[:submit]  << { type: "submit", value: }.merge(attr)
      # @body[:submit] = { options: attributes }
      
    end

    def build_input_attr(name, attr)
      value = @user.public_send(name)
      type = attr.fetch(:as, "text")
      name = name.to_s
      { name: name, value: value, type: type, label: build_label_attr(name)}.merge(attr.except(:as))
    end

    def build_label_attr(name)
      { for: name, content: name.capitalize }
    end
  end
end
