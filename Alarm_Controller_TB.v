module Alarm_Controller_tb;
  // Inputs
  reg clock;
  reg reset;
  reg one_second;
  reg time_button;
  reg alarm_button;
  reg [3:0] key;

  // Outputs
  wire load_new_a;
  wire show_a;
  wire show_new_time;
  wire shift;
  wire reset_count;

  // Instantiate the Unit Under Test (UUT)
  Alarm_Controller uut (
    .clock(clock),
    .reset(reset),
    .one_second(one_second),
    .time_button(time_button),
    .alarm_button(alarm_button),
    .key(key),
    .reset_count(reset_count),
    .load_new_a(load_new_a),
    .show_a(show_a),
    .show_new_time(show_new_time),
    .shift(shift)
  );

  // Clock generation
  initial begin
    clock = 0;
    forever #5 clock = ~clock; // 100 MHz clock
  end

  // Stimulus process
  initial begin
    // Initialize Inputs
    reset = 1;
    one_second = 0;
    time_button = 0;
    alarm_button = 0;
    key = 4'b1111; // NOKEY

    // Wait for global reset to finish
    #20;
    reset = 0;

    // Test Case 1: SHOW_TIME state
    #10;
    // No input changes, should remain in SHOW_TIME

    // Test Case 2: Press alarm_button, transition to SHOW_ALARM
    alarm_button = 1;
    #10;
    alarm_button = 0;
    #10;

    // Test Case 3: Back to SHOW_TIME from SHOW_ALARM
    alarm_button = 1;
    #10;
    alarm_button = 0;
    #10;

    // Test Case 4: Press a key, transition to KEY_STORED
    key = 4'b0001;
    #10;
    key = 4'b1111; // NOKEY
    #10;

    // Test Case 5: Press a key, transition to KEY_WAITED, then KEY_ENTRY
    key = 4'b0010;
    #10;
    key = 4'b1111; // NOKEY
    #10;
    #100; // Wait to transition through KEY_WAITED

    // Test Case 6: Timeout in KEY_ENTRY, transition to SHOW_TIME
    #100; // Simulate timeout
    #10;

    // Test Case 7: Set alarm time
    key = 4'b0011;
    alarm_button = 1;
    #10;
    alarm_button = 0;
    key = 4'b1111; // NOKEY
    #10;

    // Test Case 8: Set current time
    key = 4'b0100;
    time_button = 1;
    #10;
    time_button = 0;
    key = 4'b1111; // NOKEY
    #10;

    // Finish simulation
    $finish;
  end

  // Simulate one_second pulses
  initial begin
    forever begin
      #1000 one_second = 1;
      #10 one_second = 0;
    end
  end

endmodule
