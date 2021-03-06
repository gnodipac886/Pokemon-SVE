module gymBoundsChecker	(	input 	logic 	[1:0]	direction,
							input 	logic 	[9:0]	charxcurrpos, charycurrpos, 
							output 	logic			atBounds
							);
	/*
		direction map:
			0: 	down
			1:	up
			2:	left
			3:	right
	*/

	always_comb	begin
		atBounds 	= 	1'b0;
		unique case (direction)
			2'd0 	:	begin	//down
							if(charycurrpos == 107 || charycurrpos == 235 || charycurrpos == 363) begin	//wall
								atBounds 	= 	1'b1;
							end
							if(((charxcurrpos + 15) == 207 || (charxcurrpos + 15) == 271) && (charycurrpos + 20) == 303) begin	//statue	
								atBounds 	= 	1'b1;
							end 
						end 

			2'd1 	:	begin	//up
							if(charycurrpos == 282 || charycurrpos == 154 || charycurrpos == 26) begin	//wall
								atBounds 	= 	1'b1;
							end
							if(((charxcurrpos + 15) == 207 || (charxcurrpos + 15) == 271) && (charycurrpos + 20) == 351) begin	//statue	
								atBounds 	= 	1'b1;
							end 
						end 

			2'd2 	:	begin	//left
							if(charxcurrpos == 160 || charxcurrpos == 320 || charxcurrpos == 480) begin	//wall
								atBounds 	= 	1'b1;
							end
							if((charxcurrpos == 208 || charxcurrpos == 272) && (charycurrpos + 20) < 336 && (charycurrpos + 20) > 303) begin	//statue	
								atBounds 	= 	1'b1;
							end 
						end 


			2'd3 	:	begin	//right
							if(charxcurrpos == 128 || charxcurrpos == 288 || charxcurrpos == 448) begin	//wall
								atBounds 	= 	1'b1;
							end
							if(((charxcurrpos + 15) == 191 || (charxcurrpos + 15) == 255) && (charycurrpos + 20) < 336 && (charycurrpos + 20) > 303) begin	//statue	
								atBounds 	= 	1'b1;
							end 
						end 
			default : 	;
		endcase
	end 
endmodule

