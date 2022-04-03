module Navigation
    def self.opening_message
        font = TTY::Font.new(:doom)
        puts font.write('FITNESS    GURU')
        puts Rainbow('Welcome to the fitness guru app, where we track your dreams for you').aqua
    end

    # Menu navigation
    def self.nav_list
        [
          '1. Track your food intake and calorie intake.',
          '2. Input your workouts and you can randomize the list of workouts YOU choose.',
          '3. Exit this program.'
        ]
    end

    def self.nav_menu
        # arrays to fill for food/cal and exercise
        food_cal_pairing = []
        exercise_list = []

        active = true
        while active

        prompt = TTY::Prompt.new

        system('clear')

        opening_message

        user_selection = prompt.select(Rainbow('Please choose an option from the list').aqua, nav_list)

        # Nav
        case user_selection
        when '1. Track your food intake and calorie intake.'
            trackers(food_cal_pairing)
        when '2. Input your workouts and you can randomize the list of workouts YOU choose.'
            workouts(exercise_list)
        when '3. Exit this program.'
            return
        end
        end
    end
end
