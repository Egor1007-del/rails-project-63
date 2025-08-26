RSpec.describe HexletCode::Tag do

  it 'return div' do
    tag = HexletCode::Tag.build('div')
    expect(tag).to eq('<div></div>')
  end
  it 'return img' do
    tag = HexletCode::Tag.build('img', src: 'path/to/image')
    expect(tag).to eq('<img src="path/to/image">')
  end
  it 'return input' do
    tag = HexletCode::Tag.build('input', type: 'submit', value: 'Save')
    expect(tag).to eq('<input type="submit" value="Save">')
  end
   it 'return label' do
    tag = HexletCode::Tag.build('label') {'Email'}
    expect(tag).to eq('<label>Email</label>')
  end
end

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