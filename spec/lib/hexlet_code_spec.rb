RSpec.describe "test_full_form" do 
  it 'return form' do
    # fixture = load_fixture('full_form.html')

    User = Struct.new(:name, :job)
    user = User.new name: 'rob', job: 'hexlet'

    form = HexletCode.form_for user, class: 'hexlet-form' do |f| 
      f.input :name, class: 'user-input'
      f.input :job, as: :text
      f.submit
    end
    expect(form).to eq("<form action=\"#\" method=\"post\" class=\"hexlet-form\">\n\t<label for=\"name\" content=\"Name\"></label>\n\t<input name=\"name\" value=\"rob\" type=\"text\" class=\"user-input\">\n\t<label for=\"job\" content=\"Job\"></label>\n\t<textarea name=\"job\" cols=\"20\" rows=\"40\">hexlet</textarea>\n\t<input type=\"submit\" value=\"Save\">\n</form>")
  end
end















# RSpec.describe HexletCode::Tag do

#   it 'return div' do
#     tag = HexletCode::Tag.build('div')
#     expect(tag).to eq('<div></div>')
#   end
#   it 'return img' do
#     tag = HexletCode::Tag.build('img', src: 'path/to/image')
#     expect(tag).to eq('<img src="path/to/image">')
#   end
#   it 'return input' do
#     tag = HexletCode::Tag.build('input', type: 'submit', value: 'Save')
#     expect(tag).to eq('<input type="submit" value="Save">')
#   end
#    it 'return label' do
#     tag = HexletCode::Tag.build('label') {'Email'}
#     expect(tag).to eq('<label>Email</label>')
#   end
# end

# RSpec.describe 'test FormRender' do
#   let(:empty_user) {Struct.new(:name, :job) }
#   it 'without parameters' do 
#     user = empty_user.new name: 'rob'
#     form = FormRender.form_for user do |f|
#     end
#     expect(form).to eq('<form action="#" method="post"></form>')
#   end
#   it 'with parameters' do 
#     user = empty_user.new name: 'rob'
#     form = FormRender.form_for user, class: 'hexlet-form' do |f|
#     end
#     expect(form).to eq('<form action="#" method="post" class="hexlet-form"></form>')
#   end
#   it 'with url parameter' do 
#     user = empty_user.new name: 'rob'
#     form = FormRender.form_for user, url: '/profile', class: 'hexlet-form' do |f|
#     end
#     expect(form).to eq('<form action="/profile" method="post" class="hexlet-form"></form>')
#   end
# end