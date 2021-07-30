require_relative '../src/increment_int'

RSpec.describe IncrementInteger do
  it 'return [5, 6, 2] if passed [5, 6, 1]' do
    increment_int = IncrementInteger.new

    result = increment_int.increment([5, 6, 1])

    expect(result).to eq([5, 6, 2])
  end

  it 'return [3, 9] if passed [4, 0]' do
    increment_int = IncrementInteger.new

    result = increment_int.increment([3, 9])

    expect(result).to eq([4, 0])
  end

  it 'return [9, 9] if passed [1, 0, 0]' do
    increment_int = IncrementInteger.new

    result = increment_int.increment([9, 9])

    expect(result).to eq([1, 0, 0])
  end

  it 'return [9, 9, 9, 9] if passed [1, 0, 0, 0, 0]' do
    increment_int = IncrementInteger.new

    result = increment_int.increment([9, 9, 9, 9])

    expect(result).to eq([1, 0, 0, 0, 0])
  end

  it 'return [2] if passed [1]' do
    increment_int = IncrementInteger.new

    result = increment_int.increment([1])

    expect(result).to eq([2])
  end
end