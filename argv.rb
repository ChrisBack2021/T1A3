module ArgVectors
    def self.help
        puts 'Welcome to the Fitness Guru help desk. Please enter "./run_main.sh" to start your new fitness journey'
        puts 'For more information on how Fitness Guru works, please enter "./run_main.sh -i'
        puts 'If you are interested in the gems used to create this wonderful app, please enter "./run_main -g'
    end

    def self.info
        puts 'Welcome to the Fitness Guru app! This is the start of a new journey for you!'
        puts 'Fitness Guru allows you to track your food intake and calories in a table.'
        puts 'Not only does it allow you to track your intakes, it also outputs it to a CSV file!'
        puts 'Is that all it does? No it does more! What do you ask?'
        puts 'It also allows you to input exercises into a list, and shuffle your workout order.'
        puts 'Why is it important to randomise the order of the list you ask?'
        puts 'If you train for more than 6-8 weeks on the same routine, the exercises loses its effectiveness.'
        puts 'I hope the Fitness Guru app helps you on your journey.'
    end

    def self.gems
        puts 'Gems used for this miraculous app are "tty-prompt", "tty-table", "rainbow", "tty-font" and "text-table".'
    end
end