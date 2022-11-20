COLLEEN = Colleen
GRACE = Grace
SULLY = Sully

COLLEEN_SRC = Colleen.c
GRACE_SRC = Grace.c
SULLY_SRC = Sully.c

FLAGS = -Wall -Werror -Wextra

all: $(COLLEEN) $(GRACE) $(SULLY)

$(COLLEEN): $(COLLEEN_SRC)
	$(CC) $(FLAGS) $< -o $@

$(GRACE): $(GRACE_SRC)
	$(CC) $(FLAGS) $< -o $@

$(SULLY): $(SULLY_SRC)
	$(CC) $(FLAGS) $< -o $@

clean:
fclean:
	/bin/rm -f $(COLLEEN) $(GRACE) $(SULLY)

re: fclean
	$(MAKE)
