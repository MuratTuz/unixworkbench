#!/bin/bash
# File: guessinggame.sh

# assigning the number of files in the cwd to the numfiles scalar variable with the numbOfFiles function
function numbOfFiles() {
numfiles=`ls -1a | wc -l`
}
numbOfFiles 

# getting input from the standard input
read -n1 -p "Please enter a whole number value at the prompt which will be your best guess about how many files are in the current working directory: " guess

# handling some exceptions
if [ -z "$guess" ]
	then printf "try again, you forgot to enter a numerical value\n"
	read -p "Your guestimate: " guess
fi

if ! [[ "$guess" =~ ^[0-9]+$ ]]
	then printf "Oups, only whole number is allowed\n"
	read -n1 -p "Your guestimate: " guess
fi

# prompting more values from stdin as long as it is not equal to numfiles
while [[ $guess -ne $numfiles ]]
	do
	if [[ $guess -lt $numfiles ]]
	then printf "\nOups there are actually more than $guess files, try again please\n"
	read -n1 -p "your next guestimate: " guess
	else [[ $guess -gt $numfiles ]]
	printf "\nOups try again with a lower value\n"
	read -n1 -p "your next guestimate: " guess
	fi
done

# exiting with a welcome message to the stdout
if [[ $guess == $numfiles ]]
	then 
	printf "\nCorrect, you're good. The number of file(s) in the current working directory is $guess indeed\n"
	exit 0
fi
