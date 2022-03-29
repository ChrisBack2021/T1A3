module Food
    def self.food_tracker
        puts 'What food did you eat?'
        foods = gets.chomp.strip
        puts "How many calories was in the #{foods}?"
        calories = gets.chomp.strip
        return foods, calories
    end
end