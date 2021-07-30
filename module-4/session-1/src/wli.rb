class WLI
  attr_reader :names

  def initialize(names = [])
    @names = names
  end

  def likes
    return "no one likes this" if @names.empty?
    
    return "#{@names.first} likes this" if @names.count == 1
    
    return (@names[0...-1].join(", ") + " and #{@names.last} likes this") if @names.count <= 3

    return (@names[0...2].join(", ") + " and #{@names.count - 2} others like this")
  end

end

