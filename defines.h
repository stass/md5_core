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
 * Common definitions.
 */
`ifndef _MD5_DEFINES_H_
`define _MD5_DEFINES_H_
`define REGDELAY 1

/*
 * md5_core round signals
 */
`define CORE_ROUND1 2'b00
`define CORE_ROUND2 2'b01
`define CORE_ROUND3 2'b10
`define CORE_ROUND4 2'b11

/*
 * TLUT constants.
 */
`define T00 32'hd76aa478 /* 1 */
`define T01 32'he8c7b756 /* 2 */
`define T02 32'h242070db /* 3 */
`define T03 32'hc1bdceee /* 4 */
`define T04 32'hf57c0faf /* 5 */
`define T05 32'h4787c62a /* 6 */
`define T06 32'ha8304613 /* 7 */
`define T07 32'hfd469501 /* 8 */
`define T08 32'h698098d8 /* 9 */
`define T09 32'h8b44f7af /* 10 */
`define T10 32'hffff5bb1 /* 11 */
`define T11 32'h895cd7be /* 12 */
`define T12 32'h6b901122 /* 13 */
`define T13 32'hfd987193 /* 14 */
`define T14 32'ha679438e /* 15 */
`define T15 32'h49b40821 /* 16 */
`define T16 32'hf61e2562 /* 17 */
`define T17 32'hc040b340 /* 18 */
`define T18 32'h265e5a51 /* 19 */
`define T19 32'he9b6c7aa /* 20 */
`define T20 32'hd62f105d /* 21 */
`define T21 32'h02441453 /* 22 */
`define T22 32'hd8a1e681 /* 23 */
`define T23 32'he7d3fbc8 /* 24 */
`define T24 32'h21e1cde6 /* 25 */
`define T25 32'hc33707d6 /* 26 */
`define T26 32'hf4d50d87 /* 27 */
`define T27 32'h455a14ed /* 28 */
`define T28 32'ha9e3e905 /* 29 */
`define T29 32'hfcefa3f8 /* 30 */
`define T30 32'h676f02d9 /* 31 */
`define T31 32'h8d2a4c8a /* 32 */
`define T32 32'hfffa3942 /* 33 */
`define T33 32'h8771f681 /* 34 */
`define T34 32'h6d9d6122 /* 35 */
`define T35 32'hfde5380c /* 36 */
`define T36 32'ha4beea44 /* 37 */
`define T37 32'h4bdecfa9 /* 38 */
`define T38 32'hf6bb4b60 /* 39 */
`define T39 32'hbebfbc70 /* 40 */
`define T40 32'h289b7ec6 /* 41 */
`define T41 32'heaa127fa /* 42 */
`define T42 32'hd4ef3085 /* 43 */
`define T43 32'h04881d05 /* 44 */
`define T44 32'hd9d4d039 /* 45 */
`define T45 32'he6db99e5 /* 46 */
`define T46 32'h1fa27cf8 /* 47 */
`define T47 32'hc4ac5665 /* 48 */
`define T48 32'hf4292244 /* 49 */
`define T49 32'h432aff97 /* 50 */
`define T50 32'hab9423a7 /* 51 */
`define T51 32'hfc93a039 /* 52 */
`define T52 32'h655b59c3 /* 53 */
`define T53 32'h8f0ccc92 /* 54 */
`define T54 32'hffeff47d /* 55 */
`define T55 32'h85845dd1 /* 56 */
`define T56 32'h6fa87e4f /* 57 */
`define T57 32'hfe2ce6e0 /* 58 */
`define T58 32'ha3014314 /* 59 */
`define T59 32'h4e0811a1 /* 60 */
`define T60 32'hf7537e82 /* 61 */
`define T61 32'hbd3af235 /* 62 */
`define T62 32'h2ad7d2bb /* 63 */
`define T63 32'heb86d391 /* 64 */

/*
 * SLUT constants.
 */
`define S11 5'd7
`define S12 5'd12
`define S13 5'd17
`define S14 5'd22
`define S21 5'd5
`define S22 5'd9
`define S23 5'd14
`define S24 5'd20
`define S31 5'd4
`define S32 5'd11
`define S33 5'd16
`define S34 5'd23
`define S41 5'd6
`define S42 5'd10
`define S43 5'd15
`define S44 5'd21

`endif /* _MD5_DEFINES_H_ */
