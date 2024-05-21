##
## EPITECH PROJECT, 2023
## Makefile
## File description:
## Makefile cleaned by the code review
##

NAME =		placeholder

SRC = 		main.c			\

OBJ = 		$(SRC:.c=.o)

CFLAGS =	-Wall -Wextra

CPPFLAGS = 	-iquote ./include

LD_LIBRARY_PATH = -L.

LDFLAGS  =	-lmy			\

LIB_PATH = 	./lib/my

all:    $(NAME)

$(NAME): $(OBJ)
	$(MAKE) -C $(LIB_PATH)
	$(CC) -o $(NAME) $(OBJ) $(LD_LIBRARY_PATH) $(LDFLAGS)

tests_run: $(OBJ)
	$(MAKE) -C $(LIB_PATH)
	$(CC) -o tests/unit_tests $(SRC) tests/test_main.c \
	--coverage -lcriterion $(LD_LIBRARY_PATH) $(LDFLAGS) $(CPPFLAGS)

clean:
	rm libmy.a
	rm lib/my/libmy.a
	rm $(OBJ)

fclean: clean
	rm $(NAME)

tclean:
	rm tests/unit_tests*

re: fclean all

.PHONY = all, tests_run, clean, fclean, tclean, re
