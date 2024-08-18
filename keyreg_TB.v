module keyreg_tb;
  // Inputs
  reg reset;
  reg clock;
  reg shift;
  reg [3:0] key;

  // Outputs
  wire [3:0] key_buffer_ls_min;
  wire [3:0] key_buffer_ms_min;
  wire [3:0] key_buffer_ls_hr;
  wire [3:0] key_buffer_ms_hr;

  // Instantiate the Unit Under Test (UUT)
  keyreg uut (
    .reset(reset), 
    .clock(clock), 
    .shift(shift), 
    .key(key), 
    .key_buffer_ls_min(key_buffer_ls_min), 
    .key_buffer_ms_min(key_buffer_ms_min), 
    .key_buffer_ls_hr(key_buffer_ls_hr), 
    .key_buffer_ms_hr(key_buffer_ms_hr)
  );

  // Clock generation
  initial begin
    clock = 0;
    forever #5 clock = ~clock;
  end

  // Stimulus process
  initial begin
    // Initialize Inputs
    reset = 1;
    shift = 0;
    key = 0;

    // Wait for global reset to finish
    #10;
    reset = 0;

    // Test Case: Setting time to 12:34
    // Load key value '1'
    shift = 1;
    key = 4'b0001;
    #10;
    shift = 0;
    #10;

    // Load key value '2'
    shift = 1;
    key = 4'b0010;
    #10;
    shift = 0;
    #10;

    // Load key value '3'
    shift = 1;
    key = 4'b0011;
    #10;
    shift = 0;
    #10;

    // Load key value '4'
    shift = 1;
    key = 4'b0100;
    #10;
    shift = 0;
    #10;

    // Finish simulation
    $finish;
  end
      
endmodule

