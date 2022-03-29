require 'tty-prompt'
require 'tty-table'
require 'csv'

module Food
    def self.food_tracker
        puts 'What food did you eat?'
        foods = gets.chomp.strip
        puts "How many calories was in the #{foods}?"
        calories = gets.chomp.strip
        return foods, calories
    end
end

prompt = TTY::Prompt.new

puts 'Welcome to the fitness guru app, where we track your dreams for you'

navigation = [
    "1. Track your food intake and calorie intake",
    "2. Input your workouts and get a randomized list of workouts YOU choose.",
    "3. Exit this program"
]

# First parameter is the message of the prompt. Second parameter is the list of options, which is the navigation array
user_selection = prompt.select("Please choose an option from the list", navigation)


food_cal_pairing = []

    # Ruby gems for table
def tables(input_values)
    table = TTY::Table.new(["Food", "Calories"], (input_values))
    puts table.render(:ascii)
end

    # CRUD
user_continue = true
while user_continue == true
    puts 'If you would like to add something, please type "add".'
    puts 'To remove the last item, please type "remove".'
    puts 'If you wish to export the table to a csv, please type "csv".'
    puts 'If there is nothing to change, please type "exit".'
    user_edits = gets.chomp.strip.downcase
    case user_edits
    when 'add'
        food_cal_pairing << Food.food_tracker
        tables(food_cal_pairing)
    when 'remove'
        food_cal_pairing.delete_at(food_cal_pairing.length - 1)
        tables(food_cal_pairing)
    # File handling
    when 'csv'
        CSV.open('food_tracker.csv', 'a') do |csv|
        food_cal_pairing.each do |column|
            csv << column
            end
        end
        puts 'The file has been exported to food_tracker.csv'
    when 'exit'
        user_continue = false
    else
        puts "Invalid choice. Please select from remove, add, csv or next."
    end
end


module Workout
    def workout
        puts "Please list a minimum of 5 exercises to a maximum of 15 exercises one by one."
    end
end

case user_selection
when "1. Track your food intake and calorie intake"
   tracker
when "2. Input your workouts and get a randomized list of workouts YOU choose."
   workout
end
