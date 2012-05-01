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
 * md5 fsm test bench.
 */

`timescale 1ns/1ns
`include "defines.h"
`include "md5_fsm.v"

module md5_test();
	reg clk;
	reg rdy;
	reg [0:31] msg;
	wire [0:127] hash_o;
	wire rdy_o;
	wire busy_o;
	reg rst;
	integer j;
	integer a_i, b_i, c_i, d_i, m_i, t_i;
	reg [0:1] round_i;
	reg [0:4] s_i;
	wire [0:31] a_o;

	always begin
		#5 clk = ~clk;
	end
	
	initial begin
		clk = 0;
		$dumpvars(1, clk, a_i, b_i, c_i, d_i, round_i, m_i, s_i, t_i, a_o);
		#10;
		a_i = 1;
		b_i = 1;
		c_i = 1;
		d_i = 1;
		m_i = 1;
		t_i = 1;
		s_i = 3;
		round_i = 0;

		#40 $finish;
	end

	md5_core md5_core(a_i, b_i, c_i, d_i, round_i, m_i, s_i, t_i, a_o);
endmodule
