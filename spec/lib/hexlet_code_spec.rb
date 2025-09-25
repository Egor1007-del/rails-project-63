# frozen_string_literal: true

User = Struct.new(:name, :job)
RSpec.describe 'test_full_form' do
  let(:user) { User.new(name: 'rob', job: 'hexlet') }
  it 'return form' do
    html_fixture = read_fixture('full_form.html')

    form = HexletCode.form_for user, class: 'hexlet-form' do |f|
      f.input :name, class: 'user-input'
      f.input :job, as: :text
      f.submit
    end
    expect(form).to eq(html_fixture)
  end
end

context 'presence of a submit' do
  let(:user) { User.new(name: 'rob', job: 'hexlet') }
  it 'return submit' do
    html_fixture = read_fixture('presence_submit.html')

    form = HexletCode.form_for user, &:submit
    expect(form).to eq(html_fixture)
  end
end

context 'presence of a label' do
  let(:user) { User.new(name: 'rob', job: 'hexlet') }
  it 'return label' do
    html_fixture = read_fixture('presence_label.html')

    form = HexletCode.form_for user do |f|
      f.input :name
    end
    expect(form).to eq(html_fixture)
  end
end

context 'presence of a default value' do
  let(:user) { User.new(name: 'rob', job: 'hexlet') }
  it 'return default value' do
    html_fixture = read_fixture('presence_default_value.html')

    form = HexletCode.form_for user do |f|
      f.input :name
      f.input :job, as: :text
      f.submit
    end
    expect(form).to eq(html_fixture)
  end
end

context 'customization' do
  let(:user) { User.new(name: 'rob', job: 'hexlet') }
  it 'method=:get' do
    html_fixture = read_fixture('custom_method.html')
    form = HexletCode.form_for(user, method: :get) do |f|
      f.input :name
      f.submit
    end

    expect(form).to eq(html_fixture)
  end

  it 'custom text submit' do
    html_fixture = read_fixture('custom_text_submit.html')

    form = HexletCode.form_for(user) do |f|
      f.input :name
      f.submit 'Send'
    end

    expect(form).to eq(html_fixture)
  end
end
