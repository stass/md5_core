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
 * Control and interface module for the md5 core.
 */

`include "defines.h"

module md5_ctl(clk_i, rdy_i, msg_i, rst_i, hash_o, rdy_o, busy_o);
	input clk_i;
	input rdy_i;
	input [0:31] msg_i;
	input rst_i;
	output [0:127] hash_o;
	output rdy_o;
	output busy_o;

	wire clk_i;
	wire rdy_i, rst_i;
	wire [0:31] msg_i;
	wire [0:127] hash_o;
	reg busy_o;
	reg rdy_o;

	reg msgram0_en;
	reg msgram0_we;
	reg [0:3] msgram0_addr;
	wire [0:31] msgram0_data_i, msgram0_data_o;
	reg [0:31] rambuf, msgreg;
	reg md5fsm_rdy;
	reg [0:31] md5fsm_msg;
	wire [0:127] md5fsm_hash;
	wire [0:3] i_o;

	reg [0:5] md5_round;
	reg [0:5] ilut_md5_round;
	reg rrr;

	assign msgram0_data_i = rambuf;
	assign hash_o = md5fsm_hash;

	always @ (posedge clk_i)
	begin
		if (rst_i == 1) begin
			md5_round <= #`REGDELAY 0;
			ilut_md5_round <= #`REGDELAY 0;
			msgram0_addr <= #`REGDELAY 0;
			msgram0_we <= #`REGDELAY 0;
			msgram0_en <= #`REGDELAY 1;
			rrr <= #`REGDELAY 0;
			rdy_o <= #`REGDELAY 0;
			busy_o <= #`REGDELAY 0;
		end else begin
			if (md5_round == 0)
				rdy_o <= #`REGDELAY 1;
			else if (md5_round == 1)
				rdy_o <= #`REGDELAY 0;

			if (md5_round < 15)
				busy_o <= #`REGDELAY 0;
			else
				busy_o <= #`REGDELAY 1;
				
			if (md5_round < 16) begin
				if (rdy_i == 1) begin
					msgram0_we <= #`REGDELAY 1;
					msgram0_addr <= #`REGDELAY i_o;
					rambuf <= #`REGDELAY msg_i;
					msgreg <= #`REGDELAY msg_i;
					md5fsm_rdy <= #`REGDELAY 1;
					md5_round <= #`REGDELAY md5_round + 1;
					ilut_md5_round <= #`REGDELAY ilut_md5_round + 1;
				end else begin
					msgram0_we <= #`REGDELAY 0;
					md5fsm_rdy <= #`REGDELAY 0;
				end
			end else if (md5_round == 16 && rrr == 0) begin
					msgram0_addr <= #`REGDELAY i_o;
					msgram0_we <= #`REGDELAY 0;
					md5fsm_rdy <= #`REGDELAY 0;
					rrr <= #`REGDELAY 1;
					ilut_md5_round <= #`REGDELAY ilut_md5_round + 1;
			end else begin
					msgram0_addr <= #`REGDELAY i_o;
					md5fsm_rdy <= #`REGDELAY 1;
					msgreg <= #`REGDELAY msgram0_data_o;
					md5_round <= #`REGDELAY md5_round + 1;
					ilut_md5_round <= #`REGDELAY ilut_md5_round + 1;
			end
			if (md5_round + 1 == 0) begin
					ilut_md5_round <= #`REGDELAY 0;
					rrr <= #`REGDELAY 0;
			end
		end
	end

	always @*
	begin
		if (rrr == 0)
			md5fsm_msg = msgreg;
		else
			md5fsm_msg = msgram0_data_o;
	end

	md5_fsm md5_fsm0(clk_i, md5fsm_rdy, md5fsm_msg, rst_i, md5fsm_hash);
	sram msgram0(clk_i, rst_i, msgram0_en, msgram0_we, msgram0_addr, msgram0_data_i, msgram0_data_o);
	defparam msgram0.aw = 4;
	ilut ilut0(ilut_md5_round, i_o);
endmodule
