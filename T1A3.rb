require 'tty-prompt'
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

def tracker
    user_quit = false
        until user_quit == true
            food_cal_pairing = Food.food_tracker
            puts 'Would you like to add in more food or quit?'
            user_quit = gets.chomp
            if user_quit == "quit"
                user_quit = true
            end
        end
    return food_cal_pairing
end

table = TTY::Table.new(["Food","Calories"], [tracker])
puts table.render(:ascii)

user_continue = true
while user_continue == true
    puts 'If there is something you would like to remove, please type "remove".'
    puts 'If you would like to add something, please type "add".'
    puts 'If there is nothing to change, please type "exit".'
    user_edits = gets.chomp
    case user_edits
    when 'add'
        table << tracker
        puts table.render(:ascii)
    when 'remove'
        puts 'removed testing'
    # Below may need to be changed when you add in new features.
    when 'exit'
        user_continue = false
    else
        puts "Invalid choice. Please select from remove, add or next."
   end
end



# def workout
#     puts "this is placesetter for the workout choice"
# end

# case user_selection
# when "1. Track your food intake and calorie intake"
#    food_tracker
# when "2. Input your workouts and get a randomized list of workouts YOU choose."
#    workout
# end