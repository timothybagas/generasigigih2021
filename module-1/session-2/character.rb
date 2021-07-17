class Character
   attr_reader :name

   def initialize(name, health, damage)
      @name = name
      @health = health
      @damage = damage
   end

   def to_s
      "#{@name} has #{@health} hitpoint and #{@damage} attack damage."
   end

   def attack(other_person)
      puts "#{@name} attacks #{other_person.name} with #{@damage} damage."
      other_person.attacked(@damage)
   end

   def attacked(damage)
      @health -= damage
   end

   def alive?
      if @health <= 0
         puts "#{@name} dies."
      end
      @health > 0
   end
end
