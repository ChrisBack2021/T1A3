module Food
    # Regex validation to only allow letters
    def self.food_validator
        TTY::Prompt.new.ask('What did you eat?') do |q|
            q.validate(/^[a-zA-Z\s]+$/, Rainbow('Incorrect characters detected. Please only use characters a-z').purple)
        end
    end

    # Regex validation to only allow numbers
    def self.calorie_validator
        TTY::Prompt.new.ask('How much were the calories?') do |q|
            q.validate(/^[0-9]+$/, Rainbow('Incorrect characters detected. Please only use numbers 0-9.').purple)
        end
    end

    def self.food_tracker
        foods = food_validator.capitalize
        calories = calorie_validator
        return foods, calories
    end

    def self.food_tracker_menu
        puts Rainbow('If you would like to track your food and calories, please type "Add".').green
        puts Rainbow('To remove the last input, please type "Remove".').magenta
        puts Rainbow('To calculate the total calories, please type "Add total".').pink
        puts Rainbow('To export the table to a csv, please type "Csv".').yellow
        puts Rainbow('If there is nothing to change, please type "Exit".').red
    end

        # add food to table
    def self.add_food(food_cal_pairing)
        prompt = TTY::Prompt.new
        food_cal_pairing << food_tracker
        food_cal_pairing << food_tracker while prompt.yes?('Would you like to add another entry?') == true
    end

    # remove last line of table
    def self.remove_food(food_cal_pairing)
        food_cal_pairing.delete_at(food_cal_pairing.length - 1)
        puts Rainbow('Nothing left to delete').purple if food_cal_pairing.length.zero?
    end

    def self.add_total(food_cal_pairing)
        total_cal = food_cal_pairing.flatten.select.with_index { |_, cal| (cal + 1).even? }
        total_cal.map!(&:to_i)
        if food_cal_pairing.empty? == true
            puts Rainbow('There is nothing in the table.').purple
        else
            puts Rainbow("The total calories you consumed today is #{total_cal.sum}").blue
        end
    end

    def self.csv(food_cal_pairing)
        if food_cal_pairing.length >= 1
            CSV.open('food_tracker.csv', 'a') do |csv|
                food_cal_pairing.each do |row|
                csv << row
                end
            end
            puts Rainbow('The file has been exported to food_tracker.csv').cyan
        else
            puts Rainbow('There is nothing to export.').purple
        end
    end
end
