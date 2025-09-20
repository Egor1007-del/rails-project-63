# frozen_string_literal: true

module HexletCode
  class FormRender
    def self.rendering_html(form)
      @form = form
      <<~HTML
        <form action="#{action}" method="#{method}"#{other_attr}>
        \t#{render_tag_input}
        \t#{render_tag_submit}
        </form>
      HTML
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

      @form.body[:inputs].map { |options| render_tag(options) }.join("\n\t")
    end

    def self.render_tag(options)
      label = render_tag_label(options)
      input = build_control(options)
      [label, input].compact
    end

    def self.build_control(options)
      input_class = "HexletCode::Inputs::#{options[:type].capitalize}Input".constantize
      input_class.new(options).to_html
    end

    def self.render_tag_label(options)
      return unless options[:count] == 1

      tag_for = options[:label].except(:content)
      content = options[:label][:content]
      HexletCode::Tag.build('label', tag_for) { content }
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
