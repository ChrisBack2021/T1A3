require_relative 'navigation'
require_relative 'food'
require_relative 'exercise'
require_relative 'argv'

require 'tty-prompt'
require 'tty-table'
require 'rainbow'
require 'tty-font'
require 'text-table'

require 'csv'

# Ruby gems for table
def tables(food_cal_pairing)
    table = TTY::Table.new(%w[Food Calories], food_cal_pairing)
    puts Rainbow(table.render(:ascii)).silver
end

# CRUD for food/calorie
def trackers(food_cal_pairing)
    system('clear')
    user_continue = true
    while user_continue == true
        tables(food_cal_pairing)
        Food.food_tracker_menu
        user_edits = gets.chomp.strip.downcase
        case user_edits
        when 'add'
            Food.add_food(food_cal_pairing)
            puts 'You have ended the program'
        when 'remove'
            Food.remove_food(food_cal_pairing)
        when 'add total'
            Food.add_total(food_cal_pairing)
        when 'csv'
            Food.csv(food_cal_pairing)
        when 'exit'
            return
        else
            puts Rainbow('Invalid choice. Please select from add, remove, csv or exit.').purple
        end
    end
end

# CRUD for exercise
def workouts(exercise_list)
    system('clear')
    puts exercise_list.to_table if exercise_list.length >= 1
    user_continue = true
    while user_continue
        Exercise.exercise_menu
        exercise_input = gets.chomp.strip.capitalize
        case exercise_input
        when 'Add'
            Exercise.add(exercise_list)
        when 'Delete'
            Exercise.delete(exercise_list)
        when 'Shuffle'
            Exercise.shuffle(exercise_list)
        when 'Text'
            Exercise.text(exercise_list)
        when 'Exit'
            return
        else
            puts Rainbow('Invalid choice. Please select from add, delete, shuffle, text or exit.').purple
        end
    end
end

# CLI
def argument_vectors
    Navigation.nav_menu if ARGV.length.zero?
    case ARGV[0]
    when '-h'
        ArgVectors.help
    when '-i'
        ArgVectors.info
    when '-g'
        ArgVectors.gems
    end
end

# Error testing and also start of app
begin
argument_vectors
rescue Interrupt
    puts 'The program has been interrupted.'
rescue StandardError
    puts 'An unexpected error has occurred.'
    retry
end
