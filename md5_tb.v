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
 * md5 test bench.
 */

`timescale 1ns/1ns
`include "defines.h"
`include "md5_ctl.v"

module md5_test();
	reg clk;
	reg rdy;
	reg [0:31] msg;
	wire [0:127] hash_o;
	wire rdy_o;
	wire busy_o;
	reg rst;
	integer j;

	always begin
		#5 clk = ~clk;
	end
	
	initial begin
		clk = 0;
		rdy = 0;
		$display("time\tclk\trdy\tmsg\thash_o\trdy_o\tbusy_o\n");
		$dumpvars(1, clk, rdy, msg, rst, hash_o, rdy_o, busy_o, md5_ctl0.i_o, md5_ctl0.md5_round, md5_ctl0.msgram0_en, md5_ctl0.msgram0_we, md5_ctl0.msgram0_addr, md5_ctl0.msgram0_data_i, md5_ctl0.msgram0_data_o, md5_ctl0.md5fsm_msg, md5_ctl0.md5fsm_rdy, md5_ctl0.msgreg);
		$monitor("%g\t%b\t%b\t%h\t%h\t%b\t%b\n", $time, clk, rdy, msg, hash_o, rdy_o, busy_o);
		rst = 1;
		#10
		rst = 0;

		for (j = 0; j < 16; j = j + 1) begin
			rdy = 1;
			if (j == 0)
				msg = 1<<31;
			else
				msg = 0;
			#10;
		end
		rdy = 0;
		@ (rdy_o);
		#20 md5_ctl0.msgram0.dump(0, 63);
		for (j = 0; j < 16; j = j + 1) begin
			rdy = 1;
			if (j == 0)
				msg = 1<<31;
			else
				msg = 0;
			#10;
		end
		rdy = 0;
		@ (rdy_o);

		#20 md5_ctl0.msgram0.dump(0, 63);

		rst = 1;
		#10
		rst = 0;
/*
 * md5("aaaa") Should be 74b87337454200d4d33f80c4663dc5e5
*/
		for (j = 0; j < 16; j = j + 1) begin
			rdy = 1;
			if (j == 0)
				msg = 32'h61616161;
			else if (j == 1)
				msg = 1<<31;
			else if (j == 14)
				msg = 32'h20000000;
			else
				msg = 0;
			#10;
		end
		rdy = 0;
		@ (rdy_o);

		#20 md5_ctl0.msgram0.dump(0, 63);

		#100 $finish;
	end

	md5_ctl md5_ctl0(clk, rdy, msg, rst, hash_o, rdy_o, busy_o);
endmodule
