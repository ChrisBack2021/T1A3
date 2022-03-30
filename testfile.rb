def workout

    user_continue = true
    while user_continue == true
    puts 'add 7 exercises'
    puts 'delete'
    puts 'randomise'
    puts 'if you do not wish to create exercises, randomise from our own'
    puts 'if dont like randomise, choose your own from your inputs'
    puts 'textfile'
    puts 'exit'

    exercise_list = []
    exercise_input = gets.chomp.strip.downcase
    case exercise_input
    when 'add'
        while (exercise_list.length < 7)
            users_choice = gets.chomp.strip.downcase
                if exercise_list.include?(users_choice) == false
                    exercise_list << users_choice
                else
                    puts "That has already been added."
                end
        end
        p exercise_list
        puts "You have now added 7 exercises."
        puts "Please choose another option"
        # if exercise_input = 'add' && (exercise_list.length == 7)
        #     puts "The list is now full. You cannot add more"
        # end
    end
    end


end
workout

# a = []

# while (6 > a.length)
#   das = gets.chomp
#   a << das
# end

# workout
# workout
# output message
# create an array to store workouts
# randomize workouts
# output it back to user
# if user doesnt like, then re randomize
# if user doesn't like let him choose out of the array
# end


