require_relative 'character'

class Villain < Character
	def initialize(name, health, damage, flee_percentage)
		super(name, health, damage)
		@flee_percentage = flee_percentage
		@fled = false
	end

	def attacked(damage)
		@health -= damage

		if @health.between?(1, 50) and rand(1..100) <= @flee_percentage
			puts "#{@name} has fled the battlefield with #{@health} hitpoint left."
			@fled = true
		end
	end

	def flee?
		@fled
	end
end
