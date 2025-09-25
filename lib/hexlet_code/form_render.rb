# frozen_string_literal: true

module HexletCode
  class FormRender
    def self.rendering_html(form)
      @form = form

      HexletCode::Tag.build('form', @form.body[:form_attributes]) do
        "\n\t#{render_tag_input}\n\t#{render_tag_submit}\n"
      end
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
