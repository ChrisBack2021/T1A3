# Terminal Application - [Github repo](https://github.com/storm0105/T1A3)
# Implementation plan - [Trello board](https://trello.com/b/bsGOblk7/terminal-app)
# Control flow diagram at the planning stage - [Control flow diagram](/docs/control%20flow.png)

##

## System/Hardware requirements
- System requirements include the Ruby programming language. To download ruby, please visit: [Ruby](https://www.ruby-lang.org/en/downloads/).
- Also requires user to download bundler for the gems. Please click here for more instructions: [Installation](#installation).
- This app can be run on any device that can open a terminal.

## About this app
Fitness Guru is an app that helps track your fitness goals. It is run through the terminal and takes **you** to the navigation menu, where there are three options:
1. Food and calorie tracker
2. Exercise outputter and randomiser
3. Exit

Through this app, you will be able to track your calories easier and maximise your workouts. For more information about this app, please see [here](#features)

The app was made following the Ruby styling guide. More information about the Ruby styling guide can be found by clicking [here](https://rubystyle.guide/)

## Installation
- In order to install Fitness Guru, you must first clone or download this repo. If you have downloaded the repo, you must unzip the file.
- Once you have either cloned or unzipped the file, you have to open your terminal and go to the file location. 
- *SKIP THIS STEP IF YOU HAVE BUNDLER INSTALLED*  Please type ```gem install bundler```. The reason we type this command is to be able to install the gem dependancies that Fitness Guru relies on. The gems do not have to be manually downloaded, once you run the script in the next step it will download them automatically due to having installed bundler.
- After installing bundler, you will be able to run the app by typing ```./fitness_guru.sh``` inside the terminal.
- Enjoy your new Fitness Guru app!

## Features
- If you are in the correct directory that Fitness Guru is located, you can start the app by typing ```./fitness_guru.sh```.
- Fitness guru has a help desk that is available. The help desk is accessible by ```./fitness_guru.sh -h``` and will display the commands available for this app.
- By typing ```./fitness_guru.sh -i```, information about the app is displayed in the terminal. The information included is what the app does and tracks, and also the reasoning for the randomiser. If you wish to find out more, please type ```./fitness_guru.sh -i``` in your terminal.
- If you are curious about which gems were used for this app, they can be found by typing ```./fitness_guru.sh -g``` and can also be found by clicking [here](#dependancies).

### Fitness Guru main menu features
The menu is accessible once you start the app. Inside the main menu, you can navigate with your up/down arrow keys and there are three options to choose from:
1. *Track your food intake and calorie intake.*
   - This takes you to the food intake and calorie menu.
2. *Input your workouts and you can shuffle the list of workouts YOU choose.*
   - Selecting this option will take you to the exercise menu.
3. *Exit this program*
4. - Selecting this will exit the program and all information from the food intake/calorie intake menu and workout menu will be destroyed unless you save it to a csv or text file.

### Track your food intake and calorie intake menu
By selecting this option, you access the food intake and calorie intake menu. All the options for this menu are listed below:
 - *add* - Asks which food you ate and how much calories the food was and then adds this information to a table, which is then displayed to the user.
 - *delete* - Deletes the last line of the table.
 - *add* total - Calculates the total calories of what was enterred into the table.
 - *csv* - Outputs the table of food and calories to a csv file.
 - *exit* - Exits the food intake and calorie intake menu and returns back to the main menu. Once you type exit, the information you typed is saved and not destroyed, thus if you choose to re-enter the food intake and calorie intake menu, the information typed earlier will be displayed back to the user.

### Input your workouts and you can shuffle the list of workouts YOU choose menu
Input your workouts and you can randomize the list of workouts YOU choose.
By selecting this option, you access the exercise menu. All the options for this menu are listed below:
- *add* - User has to add 7 exercises, which is then added to a list and shown to the user.
- *delete* - User can delete any exercise inside the list.
- *shuffle* - Shuffles the exercise list so you do not have to work out in the same order every time.
- *text* - Outputs the list of exercises to a text file, which you can take to the gym with you.
- *exit* - Exits the exercise menu and returns back to the main menu. Once you type exit, the information you typed is saved and not destroyed, thus if you choose to re-enter the exercise menu, the information typed earlier will be displayed back to the user.

## Dependancies
Ruby is needed in order to run this app. If you do not have Ruby installed or wish to read up on this programming language, please visit: [Ruby](https://www.ruby-lang.org/en/downloads/).

Gems have also been used for this app. The gems used for this app are as follows:

- gem "tty-prompt", "~> 0.23.1"

- gem "rspec", "~> 3.11"

- gem "tty-table", "~> 0.12.0"

- gem "tty-font", "~> 0.5.0"

- gem "rainbow", "~> 3.1"

- gem "text-table", "~> 1.2"
  
These can be found in the Gemfile inside the repo. If you followed the instructions in [Installation](#installation), then they will be automatically added to your system. If you wish to download these manually, please find them in [rubygems](https://rubygems.org/).

## Reference
*The Ruby style Guide*, viewed 3rd April 2022, https://rubystyle.guide/#introduction