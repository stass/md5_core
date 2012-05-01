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
 * RAM pseudo-device.
 */

`include "defines.h"

module sram(clk_i, rst_i, en_i, we_i, addr_i, data_i, data_o);
	parameter aw = 6;	/* Address bus width. */
	parameter dw = 32;	/* Data width. */
	parameter readdelay = 1;	/* Readdelay. */
	parameter writedelay = 1;	/* Readdelay. */

	input clk_i;
	input rst_i;
	input en_i;		/* Chip enable. */
	input we_i;		/* Write enable. */
	input [0:aw - 1] addr_i;
	input [0:dw - 1] data_i;
	output [0:dw - 1] data_o;

	wire clk_i, rst_i, en_i, we_i;
	wire [0:aw - 1] addr_i;
	wire [0:dw - 1] data_o, data_i;
	reg [0:dw - 1] mem [0:(1 << aw) - 1];
	reg [0:dw - 1] out;
	reg [0:dw - 1] wrbuf0;
	reg [0:aw - 1] wraddr0;
	reg wr;

	assign data_o = out;
	
	always @ (posedge clk_i)
	begin
		if (rst_i == 1) begin
			wr <= #1 0;
		end else if (en_i != 0) begin
			out <= #2 mem[addr_i];

			if (we_i != 0)
			begin
				wrbuf0 <= #1 data_i;
				wraddr0 <= #1 addr_i;
				wr <= #1 1;
			end else begin
				wr <= #1 0;
			end
		   if (wr != 0) begin
				mem[wraddr0] <= #`REGDELAY wrbuf0;
		   end
		end
	end

	task dump;
		input [0:aw - 1] from;
		input [0:aw - 1] to;
		integer i;

		begin
			for (i = from; i <= to; i = i + 1)
			begin
				$display("%h:\t%h", i, mem[i]);
			end
		end
	endtask
endmodule
