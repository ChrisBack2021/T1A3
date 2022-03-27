require 'tty-prompt'
require 'text-table'
require 'tty-table'



prompt = TTY::Prompt.new

puts 'Welcome to the fitness guru app, where we track your dreams for you'


# navigation = [
#     "1. Track your food intake and calorie intake",
#     "2. Input your workouts and get a randomized list of workouts YOU choose.",
#     "3. Exit this program"
# ]

# First parameter is the message of the prompt. Second parameter is the list of options, which is the navigation array
# user_selection = prompt.select("Please choose an option from the list", navigation)
module Food

    def self.food_tracker
        puts 'What food did you eat?'
        foods = gets.chomp
        puts "How many calories was in the #{foods}?"
        calories = gets.chomp.to_i

        return foods, calories
    end

end

food_and_cal_storage = [["Food", "Calories"]]


food_and_cal_storage.push(Food.food_tracker)
food_cal_pairing = food_and_cal_storage.to_h

puts food_cal_pairing.to_table(:first_row_is_head => true)












# def workout
#     puts "this is placesetter for the workout choice"
# end

# case user_selection
#     when "1. Track your food intake and calorie intake"
#         food_tracker
#     when "2. Input your workouts and get a randomized list of workouts YOU choose."
#         workout
# end