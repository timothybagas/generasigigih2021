require_relative '../src/wli'

RSpec.describe WLI do
  it '2' do
    # given
    wli = WLI.new(["A", "B"])

    # when  
    likes = wli.likes

    # then
    expect(likes).to eq("A and B likes this")
  end

  it '3' do
    # given
    wli = WLI.new(["A", "B", "C"])

    # when
    likes = wli.likes

    # then
    expect(likes).to eq("A, B and C likes this")
  end

  it '0' do
    # given
    wli = WLI.new

    # when
    likes = wli.likes

    # then
    expect(likes).to eq("no one likes this")
  end

  it '1' do
    # given
    wli = WLI.new(["A"])

    # when
    likes = wli.likes

    # then
    expect(likes).to eq("A likes this")
  end

  it '4 or more' do
    # given
    wli = WLI.new(["A", "B", "C", "D"])

    # when
    likes = wli.likes

    # then
    expect(likes).to eq("A, B and 2 others like this")
  end
end