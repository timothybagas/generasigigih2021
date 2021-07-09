require_relative 'hero'
require_relative 'mongol'
require_relative 'character'

jin = Hero.new("Jin Sakai", 100, 50, 80)
yuna = Character.new("Yuna", 90, 45)
sensei = Character.new("Sensei Ishikawa", 80, 60)

mongol_archer = MongolArcher.new("Mongol Archer", 80, 40, 50)
mongol_spearman = MongolSpearman.new("Mongol Spearman", 120, 60, 50)
mongol_swordsman = MongolSwordsman.new("Mongol Swordsman", 100, 50, 50)

$characters = [[jin, yuna, sensei], [mongol_archer, mongol_spearman, mongol_swordsman]]
$t = [["enemy", "attack"], ["ally", "heal"]]

def control(character)
   puts "As #{character.name}, what do you want to do this turn?"
   puts "1) Attack an enemy"
   puts "2) Heal an ally"

   choice1 = gets.to_i
   puts "\n"

   puts("Which " + $t[choice1 - 1][0] + " you want to " + $t[choice1 - 1][1] + "?")
   len = $characters[choice1 & 1].length

   ((choice1 & 1)^1...len).each do |i|
      puts("#{i + 1 - (1 - choice1 % 2)}) " + $characters[choice1 & 1][i].name)
   end

   choice2 = gets.to_i
   puts "\n"

   if choice1 == 1
      character.attack($characters[1][choice2 - 1])

      if $characters[1][choice2 - 1].flee? or !$characters[1][choice2 - 1].alive?
         $characters[1].delete($characters[1][choice2 - 1])
      end
   else
      character.heal($characters[0][choice2], 20)
   end
end

x = 1

while !$characters[0].empty? and !$characters[1].empty?
   puts "========= Turn #{x} ========="
   puts "\n"

   for i in $characters
      for character in i
         puts character
      end
      puts "\n"
   end

   for hero in $characters[0]
      break if $characters[1].empty?

      if hero.name == "Jin Sakai"
         control(hero)
         next
      end

      target = rand(0...$characters[1].length)
      hero.attack($characters[1][target])
      
      if $characters[1][target].flee? or !($characters[1][target].alive?)
         $characters[1].delete($characters[1][target])
      end
   end

   puts "\n"

   for enemy in $characters[1]
      break if $characters[0].empty?

      target = rand(0...$characters[0].length)
      enemy.attack($characters[0][target])
      
      if !($characters[0][target].alive?)
         $characters[0].delete($characters[0][target])
      end
   end

   x += 1
   puts "\n"
end

puts(!($characters[0].empty?) ? "Heroes win" : "Villains win")
