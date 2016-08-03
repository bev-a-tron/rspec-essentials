require 'rspec'

describe 'hello and bye' do
  it 'returns true' do
    expect('hello').to eq('hello')
  end

  it 'fails' do
    expect('bye').to eq('hello')
  end
end