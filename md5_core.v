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
 * Combinatorial core for the MD5 algorithm. See RFC1321 for details.
 */

`include "defines.h"

module md5_core(a_i, b_i, c_i, d_i, round_i, m_i, s_i, t_i, a_o);
	input [0:31] a_i, b_i, c_i, d_i;
	input [0:1] round_i;	/* round 0-3 */
	input [0:31] m_i;	/* message */
	input [0:4] s_i;	/* shift amount */
	input [0:31] t_i;	/* T constant */
	output [0:31] a_o;	/* new a */

	wire [0:31] a_i, b_i, c_i, d_i;
	wire [0:1] round_i;
	wire [0:31] a_o, tmp;
	reg [0:31] f;

	function [0:31] F;
	input [0:31] x, y, z;
	begin
		F = (x & y) | ((~x) & z);
	end
	endfunction

	function [0:31] G;
	input [0:31] x, y, z;
	begin
		G = (x & z) | ((~z) & y);
	end
	endfunction

	function [0:31] H;
	input [0:31] x, y, z;
	begin
		H = (x ^ y ^ z);
	end
	endfunction

	function [0:31] I;
	input [0:31] x, y, z;
	begin
		I = (y ^ (x | (~z)));
	end
	endfunction

	assign tmp = a_i + f + m_i + t_i;
	assign a_o = b_i + ((tmp << s_i) | (tmp >> (32 - s_i)));

	always @ (a_i, b_i, c_i, d_i, round_i, m_i, s_i, t_i)
	begin
		case (round_i)
		`CORE_ROUND1:
		begin
			f = F(b_i, c_i, d_i);
		end
		`CORE_ROUND2:
		begin
			f = G(b_i, c_i, d_i);
		end
		`CORE_ROUND3:
		begin
			f = H(b_i, c_i, d_i);
		end
		`CORE_ROUND4:
		begin
			f = I(b_i, c_i, d_i);
		end
		endcase
	
	end
endmodule
