module counter_tb;

  // Inputs
  reg clk;
  reg reset;
  reg one_minute;
  reg load_new_c;
  reg [3:0] new_current_time_ms_hr;
  reg [3:0] new_current_time_ms_min;
  reg [3:0] new_current_time_ls_hr;
  reg [3:0] new_current_time_ls_min;

  // Outputs
  wire [3:0] current_time_ms_hr;
  wire [3:0] current_time_ms_min;
  wire [3:0] current_time_ls_hr;
  wire [3:0] current_time_ls_min;

  // Instantiate the Unit Under Test (UUT)
  counter uut (
    .clk(clk), 
    .reset(reset), 
    .one_minute(one_minute), 
    .load_new_c(load_new_c), 
    .new_current_time_ms_hr(new_current_time_ms_hr), 
    .new_current_time_ms_min(new_current_time_ms_min), 
    .new_current_time_ls_hr(new_current_time_ls_hr), 
    .new_current_time_ls_min(new_current_time_ls_min), 
    .current_time_ms_hr(current_time_ms_hr), 
    .current_time_ms_min(current_time_ms_min), 
    .current_time_ls_hr(current_time_ls_hr), 
    .current_time_ls_min(current_time_ls_min)
  );

  // Clock Generation
  always #5 clk = ~clk; // 100 MHz clock (10 ns period)
  
  // Testbench Stimulus
  initial begin
    // Initialize Inputs
    clk = 0;
    reset = 1;
    one_minute = 0;
    load_new_c = 0;
    new_current_time_ms_hr = 0;
    new_current_time_ms_min = 0;
    new_current_time_ls_hr = 0;
    new_current_time_ls_min = 0;

    // Wait 100 ns for global reset to finish
    #100;
        
    // Reset the counter
    reset = 1;
    #20;
    reset = 0;
    
    // Test Case 1: Load time 09:59 and check for rollover to 10:00
    load_new_c = 1;
    new_current_time_ms_hr = 4'd0;
    new_current_time_ls_hr = 4'd9;
    new_current_time_ms_min = 4'd5;
    new_current_time_ls_min = 4'd9;
    #10;
    load_new_c = 0;

    // Simulate 1 minute passing
    one_minute = 1;
    #10;
    one_minute = 0;
    #50;

    // Test Case 2: Load time 23:59 and check for rollover to 00:00
    load_new_c = 1;
    new_current_time_ms_hr = 4'd2;
    new_current_time_ls_hr = 4'd3;
    new_current_time_ms_min = 4'd5;
    new_current_time_ls_min = 4'd9;
    #10;
    load_new_c = 0;

    // Simulate 1 minute passing
    one_minute = 1;
    #10;
    one_minute = 0;
    #50;

    // Test Case 3: Load time 12:34 and check standard increment behavior
    load_new_c = 1;
    new_current_time_ms_hr = 4'd1;
    new_current_time_ls_hr = 4'd2;
    new_current_time_ms_min = 4'd3;
    new_current_time_ls_min = 4'd4;
    #10;
    load_new_c = 0;

    // Simulate 1 minute passing
    one_minute = 1;
    #10;
    one_minute = 0;
    #50;

    // Test Case 4: Load time 00:59 and check for rollover to 01:00
    load_new_c = 1;
    new_current_time_ms_hr = 4'd0;
    new_current_time_ls_hr = 4'd0;
    new_current_time_ms_min = 4'd5;
    new_current_time_ls_min = 4'd9;
    #10;
    load_new_c = 0;

    // Simulate 1 minute passing
    one_minute = 1;
    #10;
    one_minute = 0;
    #50;

    // Test Case 5: Load time 10:59 and check for rollover to 11:00
    load_new_c = 1;
    new_current_time_ms_hr = 4'd1;
    new_current_time_ls_hr = 4'd0;
    new_current_time_ms_min = 4'd5;
    new_current_time_ls_min = 4'd9;
    #10;
    load_new_c = 0;

    // Simulate 1 minute passing
    one_minute = 1;
    #10;
    one_minute = 0;
    #50;

    // Test Case 6: Load time 00:09 and check for standard increment to 00:10
    load_new_c = 1;
    new_current_time_ms_hr = 4'd0;
    new_current_time_ls_hr = 4'd0;
    new_current_time_ms_min = 4'd0;
    new_current_time_ls_min = 4'd9;
    #10;
    load_new_c = 0;

    // Simulate 1 minute passing
    one_minute = 1;
    #10;
    one_minute = 0;
    #50;

    // Test Case 7: Load time 00:00 and check for increment to 00:01
    load_new_c = 1;
    new_current_time_ms_hr = 4'd0;
    new_current_time_ls_hr = 4'd0;
    new_current_time_ms_min = 4'd0;
    new_current_time_ls_min = 4'd0;
    #10;
    load_new_c = 0;

    // Simulate 1 minute passing
    one_minute = 1;
    #10;
    one_minute = 0;
    #50;

    $finish;
  end
      
endmodule

