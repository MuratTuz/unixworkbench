README.md:
	@touch README.md
	@echo "# A Unix Workbench project" > README.md
	@date >> README.md
	@printf "\n" >> README.md
	@/bin/echo -ne "The number of lines of code contained in the guessinggame.sh script is: " >> README.md
	@wc -l guessinggame.sh | cut -d' ' -f1 >> README.md
