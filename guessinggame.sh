#!/bin/bash
# File: guessinggame.sh

# assigning the number of files in the cwd to the numfiles scalar variable with the numbOfFiles function
function numbOfFiles() {
numfiles=`ls -1 | wc -l`
}
numbOfFiles 

# getting input from the standard input
read -p "Please enter a whole number value at the prompt which will be your best guess about how many files are in the current working directory: "   guess

# handling some exceptions
if [ -z "$guess" ]
	then echo "try again, you forgot to enter a numerical value"
	read -p 'Your guestimate: '  guess
fi

if ! [[ "$guess" =~ ^[0-9]+$ ]]
	then echo "Oups, only whole number is allowed"
	read -p 'Your guestimate: '  guess
fi

# prompting more values from stdin as long as it is not equal to numfiles
while [[ $guess -ne $numfiles ]]
	do
	if [[ $guess -lt $numfiles ]]
	then echo "Oups there are actually more then $guess files, try again please"
	read -p "your next guestimate: " guess
	else [[ $guess -gt $numfiles ]]
	echo "Oups try again with a lower value"
	read -p "your next guestimate: " guess
	fi
done

# exiting with a welcome message to the stdout
if [[ $guess == $numfiles ]]
	then echo "Correct, you're good. The number of file(s) in the current working directory is $guess indeed"
	exit 0
fi
