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



def tracker
    food_cal_pairing = Food.food_tracker

    table = TTY::Table.new(["Food","Calories"], [food_cal_pairing])
    puts table.render(:ascii)

    user_continue = true
    while user_continue == true
        puts 'If you would like to add something, please type "add".'
        puts 'If there is something you would like to remove, please type "remove".'
        puts 'If you wish to export the table to a csv, please type "csv".'
        puts 'If there is nothing to change, please type "exit".'
        user_edits = gets.chomp.strip.downcase
        case user_edits
        when 'add'
            table << Food.food_tracker
            puts table.render(:ascii)
        when 'remove'
            puts 'remove testing'
        when 'csv'
            CSV.open('food_tracker.csv', 'a') do |csv|
                csv << [table]
            end
            puts 'The file has been exported to food_tracker.csv'
        when 'exit'
            user_continue = false
        else
            puts "Invalid choice. Please select from remove, add or next."
        end
    end
end


# def workout
#     puts "this is placesetter for the workout choice"
# end

case user_selection
when "1. Track your food intake and calorie intake"
   tracker
when "2. Input your workouts and get a randomized list of workouts YOU choose."
   workout
end