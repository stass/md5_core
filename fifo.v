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
 * fifo pseudo-device test bench.
 */
`include "defines.h"

module fifo(clk_i, rst_i, we_i, data_i, data_o, rd_i);
	input clk_i, rst_i, rd_i, we_i;
	input [0:127] data_i;
	output [0:127] data_o;

	reg [0:3] rdptr, wrptr;
	wire ram0_en;
	reg ram0_we;
	reg [0:3] ram0_addr;
	reg [0:127] ram0_data;

	assign ram0_en = 1;

	always @ (posedge clk_i) begin
		if (rst_i == 1) begin
			rdptr <= #`REGDELAY 0;
			wrptr <= #`REGDELAY 0;
			ram0_we <= #`REGDELAY 0;
			ram0_data <= #`REGDELAY 0;
		end else if (rd_i == 1) begin
			ram0_addr <= #`REGDELAY rdptr;
			rdptr <= #`REGDELAY rdptr + 1;
			ram0_we <= #`REGDELAY 0;
		end else if (we_i == 1) begin
			ram0_addr <= #`REGDELAY wrptr;
			ram0_data <= #`REGDELAY data_i;
			wrptr <= #`REGDELAY wrptr + 1;
			ram0_we <= #`REGDELAY 1;
		end else begin
			ram0_we <= #`REGDELAY 0;
		end
	end

	sram ram0(clk_i, rst_i, ram0_en, ram0_we, ram0_addr, ram0_data, data_o);
	defparam ram0.aw = 4;
	defparam ram0.dw = 128;
endmodule
