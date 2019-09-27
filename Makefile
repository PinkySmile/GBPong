NAME = pong

ASM = rgbasm

LD = rgblink

FIX = rgbfix

FIXFLAGS = -cjsv -k 01 -l 0x33 -m 0x1b -p 0 -r 03 -t "$(NAME)"

ASMFLAGS =

LDFLAGS = -n $(NAME).sym -l $(NAME).link

SRCS = main.asm

OBJS = $(SRCS:%.asm=%.o)

all:	$(NAME).gbc

run:	all
	wine "$(BGB_PATH)" ./$(NAME).gbc

%.o : %.asm
	$(ASM) $(ASMFLAGS) -o $@ $<

$(NAME).gbc:	$(OBJS)
	$(LD) $(LDFLAGS) -o $@ $(OBJS)
	$(FIX) $(FIXFLAGS) $@

clean:
	$(RM) $(OBJS)

fclean:	clean
	$(RM) $(NAME).gbc

re:	fclean all