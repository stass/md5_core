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
 * Shift amount lookup table.
 */

`include "defines.h"

module slut(round_i, s_o);
	input [0:5] round_i;	/* round 0-63 */
	output [0:4] s_o;	/* Shift amount. */

	reg [0:4] s_o;

	always @ (round_i)
	begin
		case (round_i)
		00: s_o = `S11;
		01: s_o = `S12;
		02: s_o = `S13;
		03: s_o = `S14;
		04: s_o = `S11;
		05: s_o = `S12;
		06: s_o = `S13;
		07: s_o = `S14;
		08: s_o = `S11;
		09: s_o = `S12;
		10: s_o = `S13;
		11: s_o = `S14;
		12: s_o = `S11;
		13: s_o = `S12;
		14: s_o = `S13;
		15: s_o = `S14;
		16: s_o = `S21;
		17: s_o = `S22;
		18: s_o = `S23;
		19: s_o = `S24;
		20: s_o = `S21;
		21: s_o = `S22;
		22: s_o = `S23;
		23: s_o = `S24;
		24: s_o = `S21;
		25: s_o = `S22;
		26: s_o = `S23;
		27: s_o = `S24;
		28: s_o = `S21;
		29: s_o = `S22;
		30: s_o = `S23;
		31: s_o = `S24;
		32: s_o = `S31;
		33: s_o = `S32;
		34: s_o = `S33;
		35: s_o = `S34;
		36: s_o = `S31;
		37: s_o = `S32;
		38: s_o = `S33;
		39: s_o = `S34;
		40: s_o = `S31;
		41: s_o = `S32;
		42: s_o = `S33;
		43: s_o = `S34;
		44: s_o = `S31;
		45: s_o = `S32;
		46: s_o = `S33;
		47: s_o = `S34;
		48: s_o = `S41;
		49: s_o = `S42;
		50: s_o = `S43;
		51: s_o = `S44;
		52: s_o = `S41;
		53: s_o = `S42;
		54: s_o = `S43;
		55: s_o = `S44;
		56: s_o = `S41;
		57: s_o = `S42;
		58: s_o = `S43;
		59: s_o = `S44;
		60: s_o = `S41;
		61: s_o = `S42;
		62: s_o = `S43;
		63: s_o = `S44;
		endcase
	
	end
endmodule
