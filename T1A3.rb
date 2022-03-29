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

puts 'Welcome to the fitness guru app, where we track your dreams for you'

def menu
    prompt = TTY::Prompt.new
    navigation = [
        "1. Track your food intake and calorie intake",
        "2. Input your workouts and get a randomized list of workouts YOU choose.",
        "3. Exit this program"
    ]

    user_selection = prompt.select("Please choose an option from the list", navigation)

    case user_selection
    when "1. Track your food intake and calorie intake"
        trackers
    when "2. Input your workouts and get a randomized list of workouts YOU choose."
        workout
    end
end

    # Ruby gems for table
def tables(input_values)
    table = TTY::Table.new(["Food", "Calories"], (input_values))
    puts table.render(:ascii)
end

def trackers
    food_cal_pairing = []

# CRUD.
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
            food_cal_pairing.each do |row|
                csv << row
                end
            end
            puts 'The file has been exported to food_tracker.csv'
        when 'exit'
            user_continue = false
            menu
        else
            puts "Invalid choice. Please select from remove, add, csv or next."
        end
    end
end


def workout
    puts "Placeholder"
end



# workout
# output message
# create an array to store workouts
# randomize workouts
# output it back to user
# if user doesnt like, then re randomize
# if user doesn't like let him choose out of the array
# end













menu
