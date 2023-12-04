CC=runghc
FLAGS=-Wall -Werror

.PHONY: run test
run: Main.hs input.txt
	@$(CC) $(FLAGS) Main.hs input.txt

test: Main.hs sample.txt
	@$(CC) $(FLAGS) Main.hs sample.txt
