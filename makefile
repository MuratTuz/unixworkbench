README.md:
	@touch README.md
	@echo "# A Unix Workbench project" > README.md
	@date >> README.md
	@/bin/echo -ne "The number of lines of code contained in the guessinggame.sh script is: " >> README.md
	@more guessinggame.sh | wc -l >> README.md
