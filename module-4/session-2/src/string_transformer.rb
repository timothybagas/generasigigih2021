class StringTransformer
  def initialize
    @@AL = ['a','e','i','o','u']
  end
  
  def transform(word)
    return (97 + (word.ord - 102) % 26).chr if @@AL.include?(word)
    (97 + (word.ord - 88) % 26).chr
  end

  def full_transform(word)
    transformation = ""
    word.split("").each do |w|
      transformation += transform(w)
    end
    transformation
  end
end