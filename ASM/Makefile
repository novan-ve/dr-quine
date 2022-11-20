COLLEEN = Colleen
GRACE = Grace
SULLY = Sully

COLLEEN_SRC = Colleen.s
GRACE_SRC = Grace.s
SULLY_SRC = Sully.s

COLLEEN_OBJ := $(COLLEEN_SRC:%.s=%.o)
GRACE_OBJ := $(GRACE_SRC:%.s=%.o)
SULLY_OBJ := $(SULLY_SRC:%.s=%.o)

ASM = nasm
LINKER = ld

AFLAGS = -f macho64
LFLAGS = -lSystem

all: $(COLLEEN) $(GRACE) $(SULLY)

$(COLLEEN): $(COLLEEN_SRC)
	$(ASM) $(AFLAGS) $< -o $(COLLEEN_OBJ)
	$(LINKER) $(LFLAGS) $(COLLEEN_OBJ) -o $@

$(GRACE): $(GRACE_SRC)
	$(ASM) $(AFLAGS) $< -o $(GRACE_OBJ)
	$(LINKER) $(LFLAGS) $(GRACE_OBJ) -o $@

$(SULLY): $(SULLY_SRC)
	$(ASM) $(AFLAGS) $< -o $(SULLY_OBJ)
	$(LINKER) $(LFLAGS) $(SULLY_OBJ) -o $@

clean:
	/bin/rm -f $(COLLEEN_OBJ) $(GRACE_OBJ) $(SULLY_OBJ)

fclean: clean
	/bin/rm -f $(COLLEEN) $(GRACE) $(SULLY)

re: fclean
	$(MAKE)
