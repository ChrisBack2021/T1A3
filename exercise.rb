module Exercise
    def self.exercise_menu
        puts Rainbow('To add exercises, please type "Add". Please note you must provide 7 exercises.').green
        puts Rainbow('To delete an exercise, please type "Delete".').magenta
        puts Rainbow('To change the order of the exercises, please type "Shuffle".').aliceblue
        puts Rainbow('To push it out to a text file, please type "Text".').yellow
        puts Rainbow('To exit, please type "Exit".').red
    end

    # regex to only allow letters
    def self.exercise_validator
        prompt = TTY::Prompt.new
        prompt.ask('Which exercise would you like to add?') do |q|
            q.validate(/^[a-zA-Z\s]+$/, Rainbow('Incorrect characters detected. Please only use characters a-z').purple)
        end
    end

    # adds to array
    def self.add(exercise_list)
        if exercise_list.length == 7
            puts Rainbow('The list is now full. You cannot add more.\nPlease delete if you wish to add more.').green
        end
        while exercise_list.length < 7 ? exercise_list << exercise_validator : break
        end
        puts exercise_list.to_table
        puts Rainbow('There are now 7 exercises.\nPlease choose another option').green
    end

    # Delete any array element
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
                return if exercise_list.length.zero? == true
            end
        else
            exercise_list.length.zero?
            puts Rainbow('There is nothing to delete!').purple
            return
        end
    end

    def self.shuffle(exercise_list)
        prompt = TTY::Prompt.new
        if exercise_list.length >= 2
            exercise_list.shuffle!
            puts exercise_list.to_table
            until prompt.yes?('Are you happy with the new order?') == true
                exercise_list.shuffle!
                puts exercise_list.to_table
            end
        else
            puts Rainbow('Not enough exercises to randomise. Please have more than 2.').purple
        end
    end

    def self.text(exercise_list)
        if exercise_list.length >= 1            
            file = File.open('exercise_list.txt', 'a')
            file.puts exercise_list
            file.close
            puts Rainbow('It has been exported to a text-file called exercise_list.txt').yellow
        else
            puts Rainbow('There is nothing to export.').purple
        end
    end
end
