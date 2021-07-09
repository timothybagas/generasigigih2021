require_relative 'character'

class Hero < Character
   def initialize(name, health, damage, deflect_chance)
      super(name, health, damage)
      @deflect_chance = deflect_chance
   end

   def attacked(damage)
      if rand(1..100) <= @deflect_chance
         puts "#{@name} deflects the attack."
      else
         @health -= damage
      end
   end

   def heal(other_person, hp)
      puts "#{@name} heals #{other_person.name}, restoring #{hp} hitpoints."
      other_person.attacked(-hp)
   end
end
