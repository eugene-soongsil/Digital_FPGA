module key_pad(
input	rst						,
input	clk						,	
input	[4:0]	key_v			,	
input	[3:0]	key_column_in	,	
output	reg [4:0]	key_row_out		
);

always@(negedge rst, posedge clk)
	if (rst == 0)
		key_row_out <= 5'b11111; 
	else if (key_v >= 26)
		key_row_out <= 5'b11111; 
	else	
		if 	  	(key_column_in == 4'b1110)		
			if 	  	(key_v == 01)	key_row_out <= 5'b11110;
			else if (key_v == 02)	key_row_out <= 5'b11101;
			else if (key_v == 03)	key_row_out <= 5'b11011;
			else if (key_v == 04)	key_row_out <= 5'b10111;
			else if (key_v == 05)	key_row_out <= 5'b01111;
			else if (key_v == 21)	key_row_out <= 5'b01110;
			else if (key_v == 25)	key_row_out <= 5'b11110;
			else					key_row_out <= 5'b11111;
		else if (key_column_in == 4'b1101)		
			if 	  	(key_v == 06)	key_row_out <= 5'b11110;
			else if (key_v == 07)	key_row_out <= 5'b11101;
			else if (key_v == 08)	key_row_out <= 5'b11011;
			else if (key_v == 09)	key_row_out <= 5'b10111;
			else if (key_v == 10)	key_row_out <= 5'b01111;
			else if (key_v == 22)	key_row_out <= 5'b01110;
			else if (key_v == 25)	key_row_out <= 5'b11110;
			else					key_row_out <= 5'b11111;
		else if (key_column_in == 4'b1011)		
			if 	  	(key_v == 11)	key_row_out <= 5'b11110;
			else if (key_v == 12)	key_row_out <= 5'b11101;
			else if (key_v == 13)	key_row_out <= 5'b11011;
			else if (key_v == 14)	key_row_out <= 5'b10111;
			else if (key_v == 15)	key_row_out <= 5'b01111;
			else if (key_v == 23)	key_row_out <= 5'b01110;
			else					key_row_out <= 5'b11111;
		else if (key_column_in == 4'b0111)		
			if 	  	(key_v == 16)	key_row_out <= 5'b11110;
			else if (key_v == 17)	key_row_out <= 5'b11101;
			else if (key_v == 18)	key_row_out <= 5'b11011;
			else if (key_v == 19)	key_row_out <= 5'b10111;
			else if (key_v == 20)	key_row_out <= 5'b01111;
			else if (key_v == 24)	key_row_out <= 5'b01110;
			else					key_row_out <= 5'b11111;
		else						key_row_out <= 5'b11111;

endmodule