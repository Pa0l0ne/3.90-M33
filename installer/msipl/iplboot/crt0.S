# PSP Software Development Kit - http://www.pspdev.org
# -----------------------------------------------------------------------
# Licensed under the BSD license, see LICENSE in PSPSDK root for details.
#
# crt0.S - Startup functions and definitions. Inspired by nem's helloworld.
#
# Copyright (c) 2005 Marcus R. Brown <mrbrown@ocgnet.org>
# Copyright (c) 2005 James Forshaw <tyranid@gmail.com>
# Copyright (c) 2005 John Kelley <ps2dev@kelley.ca>
#
# $Id: crt0.S 363 2005-06-27 20:35:14Z tyranid $

		.set noreorder

		.text

		.extern main

#include "as_reg_compat.h"


##############################################################################

		# Support for _init() and _fini().
;		.global _init
;		.global _fini
;		.type	_init, @function
;		.type	_fini, @function

		# The .weak keyword ensures there's no error if
		# _init/_fini aren't defined.
;		.weak	_init
;		.weak	_fini

		# Define the main thread attribute variable as weak
;		.weak   _main_thread_attr

		.global _start
		.ent _start
_start:
#;from loader
#;save r4,r5,r2,r20
#sp = $80013ff0
#		lui 	$sp, 0x040d
		jal	entry
		lui	$gp,0x0000
#goto PRE-IPL again
		lui 	$sp,0x8001
		ori 	$sp,$sp,0x3ff0
		li		$25,0x80010070
		j	$25
		nop
		.end _start
		.global _exit
		.ent _exit

_exit:
# Exit
		.end _exit

		.bss
