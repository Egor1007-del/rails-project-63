# frozen_string_literal: true

User = Struct.new(:name, :job)
RSpec.describe 'test_full_form' do
  it 'return form' do
    html_fixture = read_fixture('full_form.html')
    user = User.new name: 'rob', job: 'hexlet'

    form = HexletCode.form_for user, class: 'hexlet-form' do |f|
      f.input :name, class: 'user-input'
      f.input :job, as: :text
      f.submit
    end
    expect(form).to eq(html_fixture)
  end
end
