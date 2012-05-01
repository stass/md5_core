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
 * Sine T constant lookup table.
 */

`include "defines.h"

module tlut(round_i, t_o);
	input [0:5] round_i;	/* round 0-63 */
	output [0:31] t_o;	/* T constant */

	reg [0:31] t_o;

	always @ (round_i)
	begin
		case (round_i)
		00: t_o = `T00;
		01: t_o = `T01;
		02: t_o = `T02;
		03: t_o = `T03;
		04: t_o = `T04;
		05: t_o = `T05;
		06: t_o = `T06;
		07: t_o = `T07;
		08: t_o = `T08;
		09: t_o = `T09;
		10: t_o = `T10;
		11: t_o = `T11;
		12: t_o = `T12;
		13: t_o = `T13;
		14: t_o = `T14;
		15: t_o = `T15;
		16: t_o = `T16;
		17: t_o = `T17;
		18: t_o = `T18;
		19: t_o = `T19;
		20: t_o = `T20;
		21: t_o = `T21;
		22: t_o = `T22;
		23: t_o = `T23;
		24: t_o = `T24;
		25: t_o = `T25;
		26: t_o = `T26;
		27: t_o = `T27;
		28: t_o = `T28;
		29: t_o = `T29;
		30: t_o = `T30;
		31: t_o = `T31;
		32: t_o = `T32;
		33: t_o = `T33;
		34: t_o = `T34;
		35: t_o = `T35;
		36: t_o = `T36;
		37: t_o = `T37;
		38: t_o = `T38;
		39: t_o = `T39;
		40: t_o = `T40;
		41: t_o = `T41;
		42: t_o = `T42;
		43: t_o = `T43;
		44: t_o = `T44;
		45: t_o = `T45;
		46: t_o = `T46;
		47: t_o = `T47;
		48: t_o = `T48;
		49: t_o = `T49;
		50: t_o = `T50;
		51: t_o = `T51;
		52: t_o = `T52;
		53: t_o = `T53;
		54: t_o = `T54;
		55: t_o = `T55;
		56: t_o = `T56;
		57: t_o = `T57;
		58: t_o = `T58;
		59: t_o = `T59;
		60: t_o = `T60;
		61: t_o = `T61;
		62: t_o = `T62;
		63: t_o = `T63;
		endcase
	
	end
endmodule
