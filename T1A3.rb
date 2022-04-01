require 'tty-prompt'
require 'tty-table'
require 'rainbow'
require 'tty-font'
require 'text-table'

require 'csv'

module Navigation
    def self.opening_message
        font = TTY::Font.new(:doom)
        puts font.write("FITNESS    GURU")
        puts Rainbow('Welcome to the fitness guru app, where we track your dreams for you').aqua
    end

    # Menu navigation
    def self.nav_list
        [
          "1. Track your food intake and calorie intake",
          "2. Input your workouts and you can randomize the list of workouts YOU choose.",
          "3. Exit this program"
        ]
    end

    def self.nav_menu
        food_cal_pairing = []
        exercise_list = []

        active = true
        while active

        prompt = TTY::Prompt.new

        system("clear")

        opening_message

        user_selection = prompt.select(Rainbow("Please choose an option from the list").aqua, nav_list)

        case user_selection
        when "1. Track your food intake and calorie intake"
            trackers(food_cal_pairing)
        when "2. Input your workouts and you can randomize the list of workouts YOU choose."
            workouts(exercise_list)
        when "3. Exit this program"
            active = false
        end
        end
    end
end

module Food
    def self.food_validator
        TTY::Prompt.new.ask('What did you eat?') do |q|
            q.validate(/^[a-zA-Z]+$/, Rainbow('Incorrect characters detected. Please only use characters a-z').red)
        end
    end

    def self.calorie_validator
        TTY::Prompt.new.ask("How much were the calories?") do |q|
            q.validate(/^[0-9]+$/, Rainbow('Incorrect characters detected. Please only use numbers 0-9.').red)
        end
    end

    def self.food_tracker
        foods = food_validator
        calories = calorie_validator
        return foods, calories
    end

    def self.food_tracker_menu
        puts Rainbow('If you would like to add something, please type "add".').green
        puts Rainbow('To remove the last input, please type "remove".').magenta
        puts Rainbow('To calculate the total calories, please type "add total".').pink
        puts Rainbow('If you wish to export the table to a csv, please type "csv".').yellow
        puts Rainbow('If there is nothing to change, please type "exit".').red
    end

    def self.insert_food(food_cal_pairing)
        food_cal_pairing << Food.food_tracker
    end

    def self.add_food(food_cal_pairing)
        prompt = TTY::Prompt.new
        insert_food(food_cal_pairing)
        insert_food(food_cal_pairing) until prompt.yes?("Would you like to add another entry?") == false
    end

    def self.remove_food(food_cal_pairing)
        food_cal_pairing.delete_at(food_cal_pairing.length - 1)
        tables(food_cal_pairing)
        puts Rainbow("Nothing left to delete").red if food_cal_pairing.length.zero?
    end

    def self.add_total(food_cal_pairing)
        total_cal = food_cal_pairing.flatten.select.with_index { |_, i| (i + 1).even? }
        total_cal.map! { |cal| cal.to_i }
        if food_cal_pairing.empty? == true
            puts Rainbow("There is nothing in the table.").red
        else
            puts Rainbow("The total calories you consumed today is #{total_cal.sum}").blue
        end
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
        puts Rainbow('To add exercises, please type "add". Please note 7 exercises must be enterred.').green
        puts Rainbow('To delete an exercise, please type "delete".').magenta
        puts Rainbow('To change the order of the exercises, please type "random".').aliceblue
        puts Rainbow('To push it out to a text file, please type "text".').yellow
        puts Rainbow('To exit, please type "exit".').red
    end

    def self.character_validator
        TTY::Prompt.new.ask('Which exercise would you like to add?') do |q|
            q.validate(/^[a-zA-Z]+$/, Rainbow('Incorrect characters detected. Please only use characters a-z').red)
        end
    end

    # Exercise tracker add function
    def self.add(exercise_list)
        puts Rainbow("The list is now full. You cannot add more").purple if exercise_list.length == 7
        while exercise_list.length < 7
            users_choice = character_validator
            if exercise_list.include?(users_choice)
                puts "That has already been added."
            else
                exercise_list << users_choice
            end
        end
        puts exercise_list.to_table
        puts Rainbow("You have now added 7 exercises.\nPlease choose another option").green
    end

    # Exercise tracker
    def self.delete(exercise_list)
        prompt = TTY::Prompt.new
        if exercise_list.length >= 1
            until prompt.yes?("Are you sure you want to remove from the list?") != true
                puts 'Please input which you wish to delete.'
                puts exercise_list.to_table
                delete_item = gets.chomp.strip.downcase
                puts Rainbow("#{exercise_list.delete(delete_item)} has now been deleted.").magenta
                puts Rainbow("Below is the remaining").magenta if exercise_list.length >= 1
                puts exercise_list.to_table if exercise_list.length >= 1
                puts "There is nothing to delete!" && return if exercise_list.length.zero? == true
            end
        else
            exercise_list.length.zero?
            puts Rainbow("There is nothing to delete!").red
            return
        end
    end

    # Randomizer for exercise
    def self.random(exercise_list)
        prompt = TTY::Prompt.new
        if exercise_list.length >= 2
            exercise_list.shuffle!
            puts exercise_list.to_table
            until prompt.yes?("Are you happy with the new order?") == true
                exercise_list.shuffle!
                puts exercise_list.to_table
            end
        else
            puts Rainbow("Not enough exercises to randomise. Please have more than 2.").red
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
def tables(food_cal_pairing)
    table = TTY::Table.new(%w[Food Calories], food_cal_pairing)
    puts Rainbow(table.render(:ascii)).silver
end

# CRUD for food/calorie.
def trackers(food_cal_pairing)
    system("clear")
    tables(food_cal_pairing)
    user_continue = true
    while user_continue == true
        tables(food_cal_pairing)
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
        when 'add total'
            Food.add_total(food_cal_pairing)
        # File handling
        when 'csv'
            Food.csv(food_cal_pairing)
        # exit loop, return back to menu
        when 'exit'
            return
        # Error handling
        else
            puts Rainbow("Invalid choice. Please select from add, remove, csv or exit.").red
        end
    end
end

def workouts(exercise_list)
    system("clear")
    puts exercise_list.to_table if exercise_list.length >= 1
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

Navigation.nav_menu
