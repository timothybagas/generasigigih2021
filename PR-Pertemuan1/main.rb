require_relative 'character'

jin = Character.new("Jin Sakai", 100, 50, 80)
khotun = Character.new("Khotun Khan", 500, 50, 0)

turn = 0

while (jin.alive) and (khotun.alive)
   puts jin; puts khotun
   if turn == 0
      jin.attack(khotun)
   else
      khotun.attack(jin)
   end
   turn ^= 1
end

puts(!(jin.alive) ? "#{jin.name} dies" : "#{khotun.name} dies")
