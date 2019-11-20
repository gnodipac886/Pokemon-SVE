module frameBuffer(	input 	logic 	Clk, VGACLK, DrawEn, Reset, 
					input 	logic 	[9:0] DRAWX, DRAWY,
					input 	logic 	[7:0] keycode,
					output 	logic 	[7:0] R, G, B
					);

	logic [23:0] FBdata_In, FBdata_Out;
	logic [23:0] Chardata_Out;
	logic [18:0] FBwrite_address, FBread_address;
	logic [18:0] Charread_address;
	logic FBwe, Charwe;

	always_comb begin
		FBread_address = ((DRAWY - 80) / 2) * 240 + ((DRAWX - 80) / 2);
		if(DRAWX > 10'd79 && DRAWX < 10'd560 && DRAWY > 10'd79 && DRAWY < 10'd400) begin
			R 	= 	FBdata_Out[23:16];
			G 	= 	FBdata_Out[15:8];
			B 	= 	FBdata_Out[7:0];
		end 
		else begin
			R 	= 	8'h00;
			G 	= 	8'h00;
			B 	= 	8'h00;
		end 
	end 

	FramebufferRam FBRam(
							.data_In(FBdata_In),
							.write_address(FBwrite_address),
							.read_address(FBread_address),
							.we(FBwe),
							.Clk(Clk),
							.data_Out(FBdata_Out)
						);

	CharacterRam CharRam(
							.data_In(24'd0),
							.write_address(19'd0),
							.read_address(Charread_address),
							.we(1'b0),
							.Clk(Clk),
							.data_Out(Chardata_Out)
						);

endmodule

module frameBufferFSM(	input 	logic 			Clk, VGACLK, Reset,
						input 	logic 	[9:0] 	DRAWX, 	DRAWY,
						input 	logic 	[1:0] 	playerDir
						);
	enum logic [3:0] {start, flash_press_enter, fade, draw_map, draw_character, hold} state, next_state;

	always_ff @ (posedge Clk) begin
		if(Reset) begin
			state 	<= 	start;
		end 
		else begin
			state 	<= 	next_state;
		end 
	end 

	always_comb begin

	end 

endmodule