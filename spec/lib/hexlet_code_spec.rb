RSpec.describe HexletCode do
  it 'return div' do
    tag = HexletCode::Tag.new('div')
    expect(tag.build).to eq('<div></div>')
  end
end