module Timing_Generator_tb;

  // Inputs
  reg clock;
  reg reset;
  reg reset_count;
  reg fastwatch;

  // Outputs
  wire one_second;
  wire one_minute;

  // Instantiate the Unit Under Test (UUT)
  Timing_Generator uut (
    .clock(clock),
    .reset(reset),
    .reset_count(reset_count),
    .fastwatch(fastwatch),
    .one_second(one_second),
    .one_minute(one_minute)
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
    reset_count = 0;
    fastwatch = 0;

    // Wait for global reset to finish
    #20;
    reset = 0;

    // Test Case 1: Normal Operation - one_second pulse generation
    #1300; // Wait for more than one second (255 cycles)
    if (one_second != 1) $display("Test Case 1 Failed");

    #10;
    if (one_second != 0) $display("Test Case 1 Failed");

    // Test Case 2: Normal Operation - one_minute pulse generation
    #15350; // Wait for more than one minute (15359 cycles)
    if (one_minute != 1) $display("Test Case 2 Failed");

    #10;
    if (one_minute != 0) $display("Test Case 2 Failed");

    // Test Case 3: Reset Count - reset the internal count
    reset_count = 1;
    #10;
    reset_count = 0;

    // Wait for less than one second to ensure the count has been reset
    #1300;
    if (one_second != 0) $display("Test Case 3 Failed");

    // Test Case 4: Fastwatch Mode
    fastwatch = 1;
    #1300; // Wait for more than one second
    if (one_minute != 1) $display("Test Case 4 Failed");

    fastwatch = 0;
    #10;

    // Test Case 5: Reset
    reset = 1;
    #10;
    reset = 0;
    
    #1300;
    if (one_second != 1) $display("Test Case 5 Failed");

    #10;
    if (one_second != 0) $display("Test Case 5 Failed");

    #15350;
    if (one_minute != 1) $display("Test Case 5 Failed");

    $display("All Test Cases Completed");
    $stop;
  end

endmodule

