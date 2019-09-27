INCLUDE "hardware_constants.asm"

INCLUDE "home.asm"


SECTION "Main", ROM0

MAIN::
	ld hl, SOUND_DATA
	call PLAY_SOUND
	call STOP_SOUND
	halt

WAIT_TIME::
	xor a
	inc b
	inc c
.loop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	dec a
	jp nz, .loop
	dec b
	jp nz, .loop
	dec c
	jp nz, .loop
	ret


PLAY_SOUND::
	ld de, rNR21

	ld a, [hli]
	ld [de], a
	inc de

	ld a, [hli]
	ld [de], a
	inc de

	ld a, [hli]
	ld [de], a
	inc de

	ld a, [hli]
	ld [de], a

	ld a, [hli]
	ld c, a
	ld a, [hli]
	ld b, a
	call WAIT_TIME

	ld a, [hli]
	cp a, $FF
	jp z, PLAY_SOUND
	ret

STOP_SOUND::
	ld hl, rNR21
	xor a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ret

SOUND_DATA::
	db $00, $E0, 214, 134, $0, $10, $FF
	db $00, $E0, 172, 133, $1, $0,  $FF
	db $00, $E0, 107, 135, $2, $0,  $FF
	db $00, $E0, 214, 134, $0, $10, $FF
	db $00, $E0, 107, 135, $0, $10, $FF
	db $00, $E0, 172, 133, $0, $80, $FF
	db $00, $E0, 107, 135, $0, $40, $FF
	db $00, $E0, 214, 134, $0, $10, $FF
	db $00, $E0, 107, 135, $0, $10, $FF
	db $00, $E0, 172, 133, $0, $10, $FF
	db $00, $E0, 214, 134, $0, $10, $FF
	db $00, $E0, 107, 135, $0, $10, $FF
	db $00, $E0, 172, 133, $0, $10, $FF
	db $00, $E0, 107, 135, $0, $10, $FF
	db $00, $E0, 172, 133, $0, $10, $FF
	db $00, $E0, 214, 134, $0, $10, $FF
	db $00, $E0, 107, 135, $0, $40, $00