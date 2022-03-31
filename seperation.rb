require 'tty-prompt'
require 'tty-table'
require 'rainbow'
require 'tty-font'

require 'csv'

def workout
    prompt = TTY::Prompt.new

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
        puts Rainbow("You have now added 7 exercises.").green
        puts Rainbow("Please choose another option").green
        p exercise_list

    when 'delete'
        # if exercise_list.length.zero?
        #     puts "There is nothing to delete!"
        if exercise_list.length >= 1
            until prompt.yes?("Are you sure you want to remove from the list?") == false
                delete_array = gets.chomp.strip.downcase
                puts Rainbow("#{exercise_list.delete(delete_array)} has now been deleted. Below is the remaining:").magenta
                puts exercise_list
                if exercise_list.length.zero? == true
                    puts "There is nothing to delete!"
                end
            end
        else exercise_list.length.zero?
            puts "There is nothing to delete!"
        end
    when 'random'
        exercise_list.shuffle!
        p exercise_list
        until prompt.yes?("Are you happy with the new order?") == true
            exercise_list.shuffle!
            print exercise_list
        end
        puts "It has now been randomised. You will be redirected back to the exercise menu."
    when 'text'
        file = File.open('exercise_list.txt', 'a')
        file.puts exercise_list
        file.close
    when 'exit'
        user_continue = false
        # menu
    else
        puts Rainbow("Invalid choice. Please select from add, delete, random, text or exit.").cyan
    end
    end
end

workout