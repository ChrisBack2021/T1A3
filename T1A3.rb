puts "Welcome to the fitness guru app, where we track your dreams for you"
puts "Please choose an option from the list by inputting the list number."
puts "1. Track your food intake and calorie intake"
puts "2. Input your workouts and get a randomized list of workouts YOU choose."
puts "3. Exit this program"

navigation = gets.chomp

def food
    puts "this is is placesetter for the food choice"
end

def workout
    puts "this is placesetter for the workout choice"
end

case navigation
when "1"
    tester
when "2"
    workout
# Figure a way to quit program
end

