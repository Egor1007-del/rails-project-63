# frozen_string_literal: true

require_relative 'hexlet_code/version'
require 'active_support/core_ext/string/inflections'

module HexletCode
  autoload(:FormBuilder, File.expand_path('hexlet_code/form_builder', __dir__))
  autoload(:FormRender, File.expand_path('hexlet_code/form_render', __dir__))
  autoload(:Tag, File.expand_path('hexlet_code/tag', __dir__))
  autoload(:Inputs, File.expand_path('hexlet_code/inputs', __dir__))

  def self.form_for(user, attr = {})
    form = FormBuilder.new(user, **attr)
    yield(form) if block_given?
    FormRender.rendering_html(form)
  end
end

User = Struct.new(:name, :job)
User.new name: 'rob', job: 'hexlet'

# HexletCode.form_for user, class: 'hexlet-form' do |f|
#   f.input :name, class: 'user-input'
#   f.input :job, as: :text
#   f.submit
# end
