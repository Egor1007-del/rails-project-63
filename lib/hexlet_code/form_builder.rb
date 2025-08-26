module HexletCode
  class FormBuilder
    attr_accessor :body
    def initialize(user, **attr)
      @user = user
      action = attr.fetch(:url, '#') 
      method = attr.fetch(:method, 'post') 
      @body = { inputs: [],
                options: { action:, method: }.merge(attr.except(:url, :method))
      }
    end

    def input(name, attr = {})
      @body[:inputs] << build_input_attr(name, attr)
    end

    def build_input_attr(name, attr)
      value = @user.public_send(name)
      type = attr.fetch(:as, "text")
      name = name.to_s
      { name: name, value: value, type: type}.merge(attr.except(:as))
    end
  end
end
