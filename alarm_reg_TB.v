module alarm_reg_tb;

  // Inputs
  reg [3:0] new_alarm_ms_hr;
  reg [3:0] new_alarm_ls_hr;
  reg [3:0] new_alarm_ms_min;
  reg [3:0] new_alarm_ls_min;
  reg load_new_alarm;
  reg clock;
  reg reset;

  // Outputs
  wire [3:0] alarm_time_ms_hr;
  wire [3:0] alarm_time_ls_hr;
  wire [3:0] alarm_time_ms_min;
  wire [3:0] alarm_time_ls_min;

  // Instantiate the Unit Under Test (UUT)
  alarm_reg uut (
    .new_alarm_ms_hr(new_alarm_ms_hr), 
    .new_alarm_ls_hr(new_alarm_ls_hr), 
    .new_alarm_ms_min(new_alarm_ms_min), 
    .new_alarm_ls_min(new_alarm_ls_min), 
    .load_new_alarm(load_new_alarm), 
    .clock(clock), 
    .reset(reset), 
    .alarm_time_ms_hr(alarm_time_ms_hr), 
    .alarm_time_ls_hr(alarm_time_ls_hr), 
    .alarm_time_ms_min(alarm_time_ms_min), 
    .alarm_time_ls_min(alarm_time_ls_min)
  );

  // Clock Generation
  always #5 clock = ~clock; // 100 MHz clock (10 ns period)
  
  // Testbench Stimulus
  initial begin
    // Initialize Inputs
    clock = 0;
    reset = 1;
    load_new_alarm = 0;
    new_alarm_ms_hr = 4'b0000;
    new_alarm_ls_hr = 4'b0000;
    new_alarm_ms_min = 4'b0000;
    new_alarm_ls_min = 4'b0000;

    // Wait 100 ns for global reset to finish
    #100;
        
    // Reset the alarm register
    reset = 1;
    #20;
    reset = 0;
    
    // Test Case 1: Load new alarm time 06:45
    load_new_alarm = 1;
    new_alarm_ms_hr = 4'd0;
    new_alarm_ls_hr = 4'd6;
    new_alarm_ms_min = 4'd4;
    new_alarm_ls_min = 4'd5;
    #10;
    load_new_alarm = 0;
    #20;

    // Test Case 2: Load new alarm time 12:30
    load_new_alarm = 1;
    new_alarm_ms_hr = 4'd1;
    new_alarm_ls_hr = 4'd2;
    new_alarm_ms_min = 4'd3;
    new_alarm_ls_min = 4'd0;
    #10;
    load_new_alarm = 0;
    #20;

    // Test Case 3: Reset the alarm register and check if alarm time is cleared
    reset = 1;
    #10;
    reset = 0;
    #20;

    // Test Case 4: Load new alarm time 23:59
    load_new_alarm = 1;
    new_alarm_ms_hr = 4'd2;
    new_alarm_ls_hr = 4'd3;
    new_alarm_ms_min = 4'd5;
    new_alarm_ls_min = 4'd9;
    #10;
    load_new_alarm = 0;
    #20;

    $finish;
  end
      
endmodule

