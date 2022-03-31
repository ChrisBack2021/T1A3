require 'tty-prompt'
require 'tty-table'
require 'rainbow'

require 'csv'

module Food
    def self.food_tracker
        puts Rainbow('What food did you eat?').green
        foods = gets.chomp.strip
        puts Rainbow("How many calories was in the #{foods}?").green
        calories = gets.chomp.strip
        return foods, calories
    end
end

puts 'Welcome to the fitness guru app, where we track your dreams for you'

# Menu navigation
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
    when "3. Exit this program"
        return
    end
end

    # Ruby gems for table
def tables(input_values)
    table = TTY::Table.new(%w[Food Calories], input_values)
    puts Rainbow(table.render(:ascii)).silver
end

# CRUD for food/calorie.
def trackers
    food_cal_pairing = []

    user_continue = true
    while user_continue == true
        puts Rainbow('If you would like to add something, please type "add".').green
        puts Rainbow('To remove the last item, please type "remove".').magenta
        puts Rainbow('If you wish to export the table to a csv, please type "csv".').yellow
        puts Rainbow('If there is nothing to change, please type "exit".').red
        # Error handling via input
        user_edits = gets.chomp.strip.downcase
        case user_edits
        # Create/read/update
        when 'add'
            food_cal_pairing << Food.food_tracker 
            tables(food_cal_pairing)
        # read/delete
        when 'remove'
            food_cal_pairing.delete_at(food_cal_pairing.length - 1)
            tables(food_cal_pairing)
            if food_cal_pairing.length.zero?
                puts "Nothing left to delete"
            end
        # File handling
        when 'csv'
            CSV.open('food_tracker.csv', 'a') do |csv|
            food_cal_pairing.each do |row|
                csv << row
                end
            end
            puts 'The file has been exported to food_tracker.csv'
        # exit loop, return back to menu
        when 'exit'
            user_continue = false
            menu
        # Error handling
        else
            puts Rainbow("Invalid choice. Please select from add, remove, csv or next.").cyan
        end
    end
end

# CRUD for exercise
def workout
    exercise_list = []

    user_continue = true
    while user_continue == true
    puts Rainbow('To add exercises, please type "add". Please note only a maximum of 7 can be present at any time.').green
    puts Rainbow('To delete an exercise, please type "delete".').magenta
    puts Rainbow('To change the order of the exercises, please type "random".').aliceblue
    puts Rainbow('To push it out to a text file, please type "text".').yellow
    puts Rainbow('To exit, please type "exit".').red

    exercise_input = gets.chomp.strip.downcase
    case exercise_input
    when 'add'
        if exercise_input = 'add' && (exercise_list.length == 7)
            puts Rainbow("The list is now full. You cannot add more").purple
        end
        while exercise_list.length < 7
            users_choice = gets.chomp.strip.downcase.to_s
                if exercise_list.include?(users_choice) == false
                    exercise_list << users_choice
                else
                    puts "That has already been added."
                end
        end
        puts "You have now added 7 exercises."
        puts "Please choose another option"
        p exercise_list
    when 'delete'
        puts "Please input which exercise you wish to delete"
        if exercise_list.length.zero?
            puts "There is nothing to delete!"
        elsif exercise_list.length >= 1
            delete_array = gets.chomp.strip.downcase
            exercise_list.delete(delete_array)
        end
        p exercise_list
    when 'randomise'
        puts "It has now been randomised"
    when 'exit'
        user_continue = false
        menu
    end
    end
end

menu
