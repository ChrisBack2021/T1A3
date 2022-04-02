module Exercise
    # Exercise menu
    def self.exercise_menu
        puts Rainbow('To add exercises, please type "add". Please note 7 exercises must be enterred.').green
        puts Rainbow('To delete an exercise, please type "delete".').magenta
        puts Rainbow('To change the order of the exercises, please type "random".').aliceblue
        puts Rainbow('To push it out to a text file, please type "text".').yellow
        puts Rainbow('To exit, please type "exit".').red
    end

    def self.exercise_validator
        prompt = TTY::Prompt.new
        prompt.ask('Which exercise would you like to add?') do |q|
            q.validate(/^[a-zA-Z\s]+$/, Rainbow('Incorrect characters detected. Please only use characters a-z').red)
        end
    end

    # Exercise tracker add function
    def self.add(exercise_list)
        if exercise_list.length == 7
            puts Rainbow("The list is now full. You cannot add more. Please delete if you wish to add more.").purple
        end
        while exercise_list.length < 7 ? exercise_list << exercise_validator : break
            # if exercise_list.include?(validation)
            #     puts "That has already been added."
            # else
            #     p "hello"
            #     exercise_list << validation.call
            # end
        end
        puts exercise_list.to_table
        puts Rainbow("You have now added 7 exercises.\nPlease choose another option").green
    end

    # Exercise tracker
    def self.delete(exercise_list)
        prompt = TTY::Prompt.new
        if exercise_list.length >= 1
            until prompt.yes?('Are you sure you want to remove from the list?') != true
                puts 'Please input which you wish to delete.'
                puts exercise_list.to_table
                delete_item = gets.chomp.strip.downcase
                puts Rainbow("#{exercise_list.delete(delete_item)} has now been deleted.").magenta
                puts Rainbow('Below is the remaining').magenta if exercise_list.length >= 1
                puts exercise_list.to_table if exercise_list.length >= 1
                puts 'There is nothing to delete!' && return if exercise_list.length.zero? == true
            end
        else
            exercise_list.length.zero?
            puts Rainbow('There is nothing to delete!').red
            return
        end
    end

    # Randomizer for exercise
    def self.random(exercise_list)
        prompt = TTY::Prompt.new
        if exercise_list.length >= 2
            exercise_list.shuffle!
            puts exercise_list.to_table
            until prompt.yes?('Are you happy with the new order?') == true
                exercise_list.shuffle!
                puts exercise_list.to_table
            end
        else
            puts Rainbow('Not enough exercises to randomise. Please have more than 2.').red
        end
        puts 'It has now been randomised. You will be redirected back to the exercise menu.'
    end

    # File handling
    def self.text(exercise_list)
        file = File.open('exercise_list.txt', 'a')
        file.puts exercise_list
        file.close
        puts Rainbow('It has been exported to a text-file called exercise_list.txt').yellow
    end
end