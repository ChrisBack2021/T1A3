require "tty-prompt"

prompt = TTY::Prompt.new

puts "Welcome to the fitness guru app, where we track your dreams for you"


navigation = [
    "1. Track your food intake and calorie intake",
    "2. Input your workouts and get a randomized list of workouts YOU choose.",
    "3. Exit this program"
]

# First parameter is the message of the prompt. Second parameter is the list of options, which is the navigation array
user_selection = prompt.select("Please choose an option from the list", navigation)

def food
    puts "this is placesetter for the food choice"
end

def workout
    puts "this is placesetter for the workout choice"
end

case user_selection
    when "1. Track your food intake and calorie intake"
        food
    when "2. Input your workouts and get a randomized list of workouts YOU choose."
        workout
end


# case prompt.select("Please choose an option from the list")
#     when menu.choice = one
#         food
#     when "2"
#         workout
# end