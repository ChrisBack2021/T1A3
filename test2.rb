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
        TTY::Prompt.new.ask('What  did you eat?') do |q|
            q.validate(/^[a-zA-Z]+$/, Rainbow('Incorrect characters detected. Please only use characters a-z').red)
        end
    end
end

Food.food_validator