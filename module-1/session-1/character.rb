class Character
   attr_reader :name

   def initialize(name, health, damage, deflect_chance)
      @name = name
      @health = health
      @damage = damage
      @deflect_chance = (1 << (deflect_chance / 10)) - 1
   end

   def to_s
      "#{@name} has #{@health} hitpoint and #{@damage} attack damage.\n\n"
   end

   def attack(other_person)
      puts "#{@name} attacks #{other_person.name} with #{@damage} damage.\n\n"
      other_person.attacked(@damage)
   end

   def attacked(damage)
      power = rand(0..9)
      if (@deflect_chance & (1 << power)) > 0
         puts "#{@name} deflects the attack."
      else
         @health -= damage
      end
   end

   def alive
      @health > 0
   end
end
