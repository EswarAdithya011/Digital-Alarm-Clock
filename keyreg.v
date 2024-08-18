module keyreg (reset,clock,shift,key,
	      key_buffer_ls_min,
	      key_buffer_ms_min,
	      key_buffer_ls_hr,
	      key_buffer_ms_hr);

// Defining the port Directions
   
   input reset,
	 clock,
	 shift;

   input [3:0] key;

   output reg [3:0]  key_buffer_ls_min,
	    	     key_buffer_ms_min,
	      	     key_buffer_ls_hr,
	      	     key_buffer_ms_hr;


/*  This procedure stores the last 4 keys passed. The FSM block detects the new key value
    and triggers th shift pulse to shift in the new key value.*/

// Procedural Block

always @(posedge clock or posedge reset)
begin 
   // For the Asynchronous reset, reset the key_buffer output register to 1'b0
   if(reset)
   begin
	key_buffer_ls_min <= 0;
	key_buffer_ms_min <= 0;
	key_buffer_ls_hr  <= 0;
	key_buffer_ms_hr  <= 0;
   end
   // Else if there is a shift, perform left shift from LS_MIN to MS_HR 
   else if (shift == 1)
   begin
	key_buffer_ms_hr  <= key_buffer_ls_hr;
	key_buffer_ls_hr  <= key_buffer_ms_min;
	key_buffer_ms_min <= key_buffer_ls_min;
	key_buffer_ls_min <= key;
   end

end

endmodule
   
