require "tty-prompt"

prompt = TTY::Prompt.new

puts "Welcome to the fitness guru app, where we track your dreams for you"

prompt.select("Please choose an option from the list") do |menu|
    menu.choice "1. Track your food intake and calorie intake"
    menu.choice "2. Input your workouts and get a randomized list of workouts YOU choose."
    menu.choice "3. Exit this program"
end

def food
    puts "this is placesetter for the food choice"
end

def workout
    puts "this is placesetter for the workout choice"
end

case prompt.select("Please choose an option from the list")
    when menu.choice = 1
        food
    when "2"
        workout
# Figure a way to quit program
end

