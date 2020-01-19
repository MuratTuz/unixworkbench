#!/bin/bash
# File: guessinggame.sh

# user input exception handling
function wholeNumbInput() {
    printf "%d" $guess > /dev/null 2>&1
    return $?
}

# assigning the number of files in the cwd to the numfiles scalar variable
numfiles=`ls -1a | wc -l`

# getting input from the standard input
read  -p "Please enter a whole number value at the prompt which will be your best guess about how many files are in the current working directory: " guess

while ! wholeNumbInput $guess
	do printf "Oups, only whole number is allowed\n" 
	read -p "Your guestimate: " guess
done
# prompting more values from stdin as long as it is not equal to numfiles
while [[ $guess -ne $numfiles ]]
	do
	if [[ $guess -lt $numfiles ]]
		then printf "\nOups there are actually more than $guess files, try again please\n"
		read -p "your next guestimate: " guess
			while ! wholeNumbInput $guess
			do printf "Oups, only whole number is allowed\n" 
			read -p "your next guestimate: " guess
			done
	else [[ $guess -gt $numfiles ]]
		printf "\nOups try again with a lower value\n"
		read -p "your next guestimate: " guess
			while ! wholeNumbInput $guess
			do printf "Oups, only whole number is allowed\n" 
			read -p "your next guestimate: " guess
			done
	fi
done
# exiting with a welcome message to the stdout
if [[ $guess == $numfiles ]]
	then 
	printf "\nCorrect, you're good. The number of file(s) in the current working directory is $guess indeed\n"
	exit 0
fi

