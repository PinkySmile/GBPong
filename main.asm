INCLUDE "hardware_constants.asm"

INCLUDE "home.asm"


SECTION "Main", ROM0

MAIN::
	xor a
.loop
	inc a
	jp nz, .loop
	halt