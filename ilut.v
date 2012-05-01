/*-
 * Copyright (c) 2009 Stanislav Sedov <stas@FreeBSD.org>.
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 * 1. Redistributions of source code must retain the above copyright
 *    notice, this list of conditions and the following disclaimer.
 * 2. Redistributions in binary form must reproduce the above copyright
 *    notice, this list of conditions and the following disclaimer in the
 *    documentation and/or other materials provided with the distribution.
 *
 * THIS SOFTWARE IS PROVIDED BY THE AUTHOR ``AS IS'' AND ANY EXPRESS OR
 * IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES
 * OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.
 * IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY DIRECT, INDIRECT,
 * INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT
 * NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
 * DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
 * THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF
 * THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 *
 * Message word index lookup table.
 */

`include "defines.h"

module ilut(round_i, i_o);
	input [0:5] round_i;	/* round 0-63 */
	output [0:3] i_o;	/* Message word. */

	reg [0:3] i_o;

	always @*
	begin
		case (round_i)
		00: i_o = 00;
		01: i_o = 01;
		02: i_o = 02;
		03: i_o = 03;
		04: i_o = 04;
		05: i_o = 05;
		06: i_o = 06;
		07: i_o = 07;
		08: i_o = 08;
		09: i_o = 09;
		10: i_o = 10;
		11: i_o = 11;
		12: i_o = 12;
		13: i_o = 13;
		14: i_o = 14;
		15: i_o = 15;
		16: i_o = 01;
		17: i_o = 06;
		18: i_o = 11;
		19: i_o = 00;
		20: i_o = 05;
		21: i_o = 10;
		22: i_o = 15;
		23: i_o = 04;
		24: i_o = 09;
		25: i_o = 14;
		26: i_o = 03;
		27: i_o = 08;
		28: i_o = 13;
		29: i_o = 02;
		30: i_o = 07;
		31: i_o = 12;
		32: i_o = 05;
		33: i_o = 08;
		34: i_o = 11;
		35: i_o = 14;
		36: i_o = 01;
		37: i_o = 04;
		38: i_o = 07;
		39: i_o = 10;
		40: i_o = 13;
		41: i_o = 00;
		42: i_o = 03;
		43: i_o = 06;
		44: i_o = 09;
		45: i_o = 12;
		46: i_o = 15;
		47: i_o = 02;
		48: i_o = 00;
		49: i_o = 07;
		50: i_o = 14;
		51: i_o = 05;
		52: i_o = 12;
		53: i_o = 03;
		54: i_o = 10;
		55: i_o = 01;
		56: i_o = 08;
		57: i_o = 15;
		58: i_o = 06;
		59: i_o = 13;
		60: i_o = 04;
		61: i_o = 11;
		62: i_o = 02;
		63: i_o = 09;
		endcase
	
	end
endmodule
