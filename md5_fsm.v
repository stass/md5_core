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
 * MD5 main FSM.
 */

`include "defines.h"

module md5_fsm(clk_i, rdy_i, msg_i, rst_i, hash_o);
	input clk_i;
	input rdy_i;
	input [0:31] msg_i;
	input rst_i;
	output [0:127] hash_o;

	wire clk_i;
	wire rdy_i, rst_i;
	wire [0:31] msg_i;
	wire [0:127] hash_o;

	reg [0:31] core_a, core_b, core_c, core_d;
	reg [0:1] core_round;
	wire [0:31] core_m, core_t;
	wire [0:4] core_s;
	wire [0:31] core_out;

	reg [0:5] round;
	wire [0:4] s_o;
	wire [0:31] t_o;

	reg [0:31] h0, h1, h2, h3;
	reg [0:31] a;
	reg [0:31] b;
	reg [0:31] c;
	reg [0:31] d;
	
	assign core_m = {msg_i[24:31], msg_i[16:23], msg_i[8:15], msg_i[0:7]};
	assign core_s = s_o;
	assign core_t = t_o;
	assign hash_o = {h0[24:31], h0[16:23], h0[8:15], h0[0:7],
	    h1[24:31], h1[16:23], h1[8:15], h1[0:7],
	    h2[24:31], h2[16:23], h2[8:15], h2[0:7],
	    h3[24:31], h3[16:23], h3[8:15], h3[0:7]}; /* Damn LE stuff. */

	always @ (posedge clk_i)
	begin
		if (rst_i == 1) begin
			round <= #`REGDELAY 0;
			h0 <= #`REGDELAY 32'h67452301;
			h1 <= #`REGDELAY 32'hefcdab89;
			h2 <= #`REGDELAY 32'h98badcfe;
			h3 <= #`REGDELAY 32'h10325476;
			a <= #`REGDELAY 32'h67452301;
			b <= #`REGDELAY 32'hefcdab89;
			c <= #`REGDELAY 32'h98badcfe;
			d <= #`REGDELAY 32'h10325476;
		end else begin
			if (rdy_i == 1) begin
				round <= #`REGDELAY round + 1;
				case (round)
				0: begin
					a <= #`REGDELAY core_out;
				end
				1: begin
					d <= #`REGDELAY core_out;
				end
				2: begin
					c <= #`REGDELAY core_out;
				end
				3: begin
					b <= #`REGDELAY core_out;
				end
				4: begin
					a <= #`REGDELAY core_out;
				end
				5: begin
					d <= #`REGDELAY core_out;
				end
				6: begin
					c <= #`REGDELAY core_out;
				end
				7: begin
					b <= #`REGDELAY core_out;
				end
				8: begin
					a <= #`REGDELAY core_out;
				end
				9: begin
					d <= #`REGDELAY core_out;
				end
				10: begin
					c <= #`REGDELAY core_out;
				end
				11: begin
					b <= #`REGDELAY core_out;
				end
				12: begin
					a <= #`REGDELAY core_out;
				end
				13: begin
					d <= #`REGDELAY core_out;
				end
				14: begin
					c <= #`REGDELAY core_out;
				end
				15: begin
					b <= #`REGDELAY core_out;
				end
				16: begin
					a <= #`REGDELAY core_out;
				end
				17: begin
					d <= #`REGDELAY core_out;
				end
				18: begin
					c <= #`REGDELAY core_out;
				end
				19: begin
					b <= #`REGDELAY core_out;
				end
				20: begin
					a <= #`REGDELAY core_out;
				end
				21: begin
					d <= #`REGDELAY core_out;
				end
				22: begin
					c <= #`REGDELAY core_out;
				end
				23: begin
					b <= #`REGDELAY core_out;
				end
				24: begin
					a <= #`REGDELAY core_out;
				end
				25: begin
					d <= #`REGDELAY core_out;
				end
				26: begin
					c <= #`REGDELAY core_out;
				end
				27: begin
					b <= #`REGDELAY core_out;
				end
				28: begin
					a <= #`REGDELAY core_out;
				end
				29: begin
					d <= #`REGDELAY core_out;
				end
				30: begin
					c <= #`REGDELAY core_out;
				end
				31: begin
					b <= #`REGDELAY core_out;
				end
				32: begin
					a <= #`REGDELAY core_out;
				end
				33: begin
					d <= #`REGDELAY core_out;
				end
				34: begin
					c <= #`REGDELAY core_out;
				end
				35: begin
					b <= #`REGDELAY core_out;
				end
				36: begin
					a <= #`REGDELAY core_out;
				end
				37: begin
					d <= #`REGDELAY core_out;
				end
				38: begin
					c <= #`REGDELAY core_out;
				end
				39: begin
					b <= #`REGDELAY core_out;
				end
				40: begin
					a <= #`REGDELAY core_out;
				end
				41: begin
					d <= #`REGDELAY core_out;
				end
				42: begin
					c <= #`REGDELAY core_out;
				end
				43: begin
					b <= #`REGDELAY core_out;
				end
				44: begin
					a <= #`REGDELAY core_out;
				end
				45: begin
					d <= #`REGDELAY core_out;
				end
				46: begin
					c <= #`REGDELAY core_out;
				end
				47: begin
					b <= #`REGDELAY core_out;
				end
				48: begin
					a <= #`REGDELAY core_out;
				end
				49: begin
					d <= #`REGDELAY core_out;
				end
				50: begin
					c <= #`REGDELAY core_out;
				end
				51: begin
					b <= #`REGDELAY core_out;
				end
				52: begin
					a <= #`REGDELAY core_out;
				end
				53: begin
					d <= #`REGDELAY core_out;
				end
				54: begin
					c <= #`REGDELAY core_out;
				end
				55: begin
					b <= #`REGDELAY core_out;
				end
				56: begin
					a <= #`REGDELAY core_out;
				end
				57: begin
					d <= #`REGDELAY core_out;
				end
				58: begin
					c <= #`REGDELAY core_out;
				end
				59: begin
					b <= #`REGDELAY core_out;
				end
				60: begin
					a <= #`REGDELAY core_out;
				end
				61: begin
					d <= #`REGDELAY core_out;
				end
				62: begin
					c <= #`REGDELAY core_out;
				end
				63: begin
					h0 <= #`REGDELAY h0 + a;
					h1 <= #`REGDELAY h1 + core_out;
					h2 <= #`REGDELAY h2 + c;
					h3 <= #`REGDELAY h3 + d;
					a <= #`REGDELAY h0 + a;
					b <= #`REGDELAY h1 + core_out;
					c <= #`REGDELAY h2 + c;
					d <= #`REGDELAY h3 + d;
				end
				endcase
			end
		end
	end

	always @*
	begin
		case (round)
		0: begin
			core_a = a;
			core_b = b;
			core_c = c;
			core_d = d;
		end
		1: begin
			core_a = d;
			core_b = a;
			core_c = b;
			core_d = c;
		end
		2: begin
			core_a = c;
			core_b = d;
			core_c = a;
			core_d = b;
		end
		3: begin
			core_a = b;
			core_b = c;
			core_c = d;
			core_d = a;
		end
		4: begin
			core_a = a;
			core_b = b;
			core_c = c;
			core_d = d;
		end
		5: begin
			core_a = d;
			core_b = a;
			core_c = b;
			core_d = c;
		end
		6: begin
			core_a = c;
			core_b = d;
			core_c = a;
			core_d = b;
		end
		7: begin
			core_a = b;
			core_b = c;
			core_c = d;
			core_d = a;
		end
		8: begin
			core_a = a;
			core_b = b;
			core_c = c;
			core_d = d;
		end
		9: begin
			core_a = d;
			core_b = a;
			core_c = b;
			core_d = c;
		end
		10: begin
			core_a = c;
			core_b = d;
			core_c = a;
			core_d = b;
		end
		11: begin
			core_a = b;
			core_b = c;
			core_c = d;
			core_d = a;
		end
		12: begin
			core_a = a;
			core_b = b;
			core_c = c;
			core_d = d;
		end
		13: begin
			core_a = d;
			core_b = a;
			core_c = b;
			core_d = c;
		end
		14: begin
			core_a = c;
			core_b = d;
			core_c = a;
			core_d = b;
		end
		15: begin
			core_a = b;
			core_b = c;
			core_c = d;
			core_d = a;
		end
		16: begin
			core_a = a;
			core_b = b;
			core_c = c;
			core_d = d;
		end
		17: begin
			core_a = d;
			core_b = a;
			core_c = b;
			core_d = c;
		end
		18: begin
			core_a = c;
			core_b = d;
			core_c = a;
			core_d = b;
		end
		19: begin
			core_a = b;
			core_b = c;
			core_c = d;
			core_d = a;
		end
		20: begin
			core_a = a;
			core_b = b;
			core_c = c;
			core_d = d;
		end
		21: begin
			core_a = d;
			core_b = a;
			core_c = b;
			core_d = c;
		end
		22: begin
			core_a = c;
			core_b = d;
			core_c = a;
			core_d = b;
		end
		23: begin
			core_a = b;
			core_b = c;
			core_c = d;
			core_d = a;
		end
		24: begin
			core_a = a;
			core_b = b;
			core_c = c;
			core_d = d;
		end
		25: begin
			core_a = d;
			core_b = a;
			core_c = b;
			core_d = c;
		end
		26: begin
			core_a = c;
			core_b = d;
			core_c = a;
			core_d = b;
		end
		27: begin
			core_a = b;
			core_b = c;
			core_c = d;
			core_d = a;
		end
		28: begin
			core_a = a;
			core_b = b;
			core_c = c;
			core_d = d;
		end
		29: begin
			core_a = d;
			core_b = a;
			core_c = b;
			core_d = c;
		end
		30: begin
			core_a = c;
			core_b = d;
			core_c = a;
			core_d = b;
		end
		31: begin
			core_a = b;
			core_b = c;
			core_c = d;
			core_d = a;
		end
		32: begin
			core_a = a;
			core_b = b;
			core_c = c;
			core_d = d;
		end
		33: begin
			core_a = d;
			core_b = a;
			core_c = b;
			core_d = c;
		end
		34: begin
			core_a = c;
			core_b = d;
			core_c = a;
			core_d = b;
		end
		35: begin
			core_a = b;
			core_b = c;
			core_c = d;
			core_d = a;
		end
		36: begin
			core_a = a;
			core_b = b;
			core_c = c;
			core_d = d;
		end
		37: begin
			core_a = d;
			core_b = a;
			core_c = b;
			core_d = c;
		end
		38: begin
			core_a = c;
			core_b = d;
			core_c = a;
			core_d = b;
		end
		39: begin
			core_a = b;
			core_b = c;
			core_c = d;
			core_d = a;
		end
		40: begin
			core_a = a;
			core_b = b;
			core_c = c;
			core_d = d;
		end
		41: begin
			core_a = d;
			core_b = a;
			core_c = b;
			core_d = c;
		end
		42: begin
			core_a = c;
			core_b = d;
			core_c = a;
			core_d = b;
		end
		43: begin
			core_a = b;
			core_b = c;
			core_c = d;
			core_d = a;
		end
		44: begin
			core_a = a;
			core_b = b;
			core_c = c;
			core_d = d;
		end
		45: begin
			core_a = d;
			core_b = a;
			core_c = b;
			core_d = c;
		end
		46: begin
			core_a = c;
			core_b = d;
			core_c = a;
			core_d = b;
		end
		47: begin
			core_a = b;
			core_b = c;
			core_c = d;
			core_d = a;
		end
		48: begin
			core_a = a;
			core_b = b;
			core_c = c;
			core_d = d;
		end
		49: begin
			core_a = d;
			core_b = a;
			core_c = b;
			core_d = c;
		end
		50: begin
			core_a = c;
			core_b = d;
			core_c = a;
			core_d = b;
		end
		51: begin
			core_a = b;
			core_b = c;
			core_c = d;
			core_d = a;
		end
		52: begin
			core_a = a;
			core_b = b;
			core_c = c;
			core_d = d;
		end
		53: begin
			core_a = d;
			core_b = a;
			core_c = b;
			core_d = c;
		end
		54: begin
			core_a = c;
			core_b = d;
			core_c = a;
			core_d = b;
		end
		55: begin
			core_a = b;
			core_b = c;
			core_c = d;
			core_d = a;
		end
		56: begin
			core_a = a;
			core_b = b;
			core_c = c;
			core_d = d;
		end
		57: begin
			core_a = d;
			core_b = a;
			core_c = b;
			core_d = c;
		end
		58: begin
			core_a = c;
			core_b = d;
			core_c = a;
			core_d = b;
		end
		59: begin
			core_a = b;
			core_b = c;
			core_c = d;
			core_d = a;
		end
		60: begin
			core_a = a;
			core_b = b;
			core_c = c;
			core_d = d;
		end
		61: begin
			core_a = d;
			core_b = a;
			core_c = b;
			core_d = c;
		end
		62: begin
			core_a = c;
			core_b = d;
			core_c = a;
			core_d = b;
		end
		63: begin
			core_a = b;
			core_b = c;
			core_c = d;
			core_d = a;
		end
		endcase
	end

	always @* begin
		if (round < 16) begin
			core_round = 0;
		end else if (round < 32) begin
			core_round = 1;
		end else if (round < 48) begin
			core_round = 2;
		end else begin
			core_round = 3;
		end
	end

	md5_core md5_core0(core_a, core_b, core_c, core_d, core_round, core_m,
	    core_s, core_t, core_out);
	slut slut0(round, s_o);
	tlut tlut0(round, t_o);
endmodule
