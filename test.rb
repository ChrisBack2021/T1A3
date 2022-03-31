require 'tty-prompt'
require 'tty-table'
require 'rainbow'
require 'tty-font'

require 'csv'

module Navigation
    def self.opening_message
        font = TTY::Font.new(:doom)
        puts font.write("FITNESS   GURU")
        puts Rainbow('Welcome to the fitness guru app, where we track your dreams for you').aqua
    end

    # Menu navigation
end

    def nav_menu
        food_cal_pairing = []
        exercise_list = []
        active = true
        while active
        p exercise_list
        prompt = TTY::Prompt.new
        navigation = [
          "1. Track your food intake and calorie intake",
          "2. Input your workouts and get a randomized list of workouts YOU choose.",
          "3. Exit this program"
        ]

        user_selection = prompt.select(Rainbow("Please choose an option from the list").aqua, navigation)

        case user_selection
        when "1. Track your food intake and calorie intake"
            trackers
        when "2. Input your workouts and get a randomized list of workouts YOU choose."
            workouts(exercise_list)
        when "3. Exit this program"
            active = false
        end
        end
    end

module Food
    def self.food_tracker
        puts Rainbow('What food did you eat?').green
        foods = gets.chomp.strip
        puts Rainbow("How many calories was in the #{foods}?").green
        calories = gets.chomp.strip
        return foods, calories
    end

    def self.food_tracker_menu
        puts Rainbow('If you would like to add something, please type "add".').green
        puts Rainbow('To remove the last input, please type "remove".').magenta
        puts Rainbow('If you wish to export the table to a csv, please type "csv".').yellow
        puts Rainbow('If there is nothing to change, please type "exit".').red
    end

    def self.add_food(food_cal_pairing)
        food_cal_pairing << Food.food_tracker
        tables(food_cal_pairing)
    end

    def self.remove_food(food_cal_pairing)
        food_cal_pairing.delete_at(food_cal_pairing.length - 1)
        tables(food_cal_pairing)
        puts "Nothing left to delete" if food_cal_pairing.length.zero?
    end

    def self.csv(food_cal_pairing)
        CSV.open('food_tracker.csv', 'a') do |csv|
            food_cal_pairing.each do |row|
            csv << row
            end
        end
        puts 'The file has been exported to food_tracker.csv'
    end
end

module Exercise
    # Exercise menu
    def self.exercise_menu
        puts Rainbow('To add exercises, please type "add". Please note only a maximum of 7 can be present at any time.').green
        puts Rainbow('To delete an exercise, please type "delete".').magenta
        puts Rainbow('To change the order of the exercises, please type "random".').aliceblue
        puts Rainbow('To push it out to a text file, please type "text".').yellow
        puts Rainbow('To exit, please type "exit".').red
    end

    # Exercise tracker add function
    def self.add(exercise_list)
        puts Rainbow("The list is now full. You cannot add more").purple if exercise_list.length == 7
        while exercise_list.length < 7
            users_choice = gets.chomp.strip.downcase.to_s
            if exercise_list.include?(users_choice)
                puts "That has already been added."
            else
                exercise_list << users_choice
            end
        end
        p exercise_list
        puts Rainbow("You have now added 7 exercises.\nPlease choose another option").green
    end

    # Exercise tracker
    def self.delete(exercise_list)
        prompt = TTY::Prompt.new
        if exercise_list.length >= 1
            until prompt.yes?("Are you sure you want to remove from the list?") == false
                puts 'Please input which you wish to delete.'
                p exercise_list
                delete_array = gets.chomp.strip.downcase
                puts Rainbow("#{exercise_list.delete(delete_array)} has now been deleted. Below is the remaining:").magenta
                puts exercise_list
                puts "There is nothing to delete!" if exercise_list.length.zero? == true
            end
        else
            exercise_list.length.zero?
            puts "There is nothing to delete!"
            return
        end
    end

    # Randomizer for exercise
    def self.random(exercise_list)
        prompt = TTY::Prompt.new
        exercise_list.shuffle!
        p exercise_list
        until prompt.yes?("Are you happy with the new order?") == true
            exercise_list.shuffle!
            print exercise_list
        end
        puts "It has now been randomised. You will be redirected back to the exercise menu."
    end

    # File handling
    def self.text(exercise_list)
        file = File.open('exercise_list.txt', 'a')
        file.puts exercise_list
        file.close
    end
end

# Ruby gems for table
def tables(input_values)
    table = TTY::Table.new(%w[Food Calories], input_values)
    puts Rainbow(table.render(:ascii)).silver
end

Navigation.opening_message

# CRUD for food/calorie.
def trackers
    user_continue = true
    while user_continue == true
        Food.food_tracker_menu
        # Error handling via input
        user_edits = gets.chomp.strip.downcase
        case user_edits
        # Create/read/update
        when 'add'
            Food.add_food(food_cal_pairing)
        # read/delete
        when 'remove'
            Food.remove_food(food_cal_pairing)
        # File handling
        when 'csv'
            Food.csv(food_cal_pairing)
        # exit loop, return back to menu
        when 'exit'
            return
        # Error handling
        else
            puts Rainbow("Invalid choice. Please select from add, remove, csv or exit.").cyan
        end
    end
end

def workouts(exercise_list)
    user_continue = true
    while user_continue
        Exercise.exercise_menu
        exercise_input = gets.chomp.strip.downcase
        case exercise_input
        when 'add'
            Exercise.add(exercise_list)
        when 'delete'
            Exercise.delete(exercise_list)
        when 'random'
            Exercise.random(exercise_list)
        when 'text'
            Exercise.text(exercise_list)
        when 'exit'
            return
        else
            puts Rainbow("Invalid choice. Please select from add, delete, random, text or exit.").cyan
        end
    end
end

nav_menu

# arr = ["black","green","yellow","pink"]
# p arr
# def add_colour(arr)
#     blue = "blue"
#     arr << blue
# end
# add_colour(arr)
# p arr