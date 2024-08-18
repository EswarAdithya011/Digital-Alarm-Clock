module lcd_driver_tb;

  // Inputs
  reg [3:0] key;
  reg [3:0] alarm_time;
  reg [3:0] current_time;
  reg [3:0] show_alarm;
  reg show_new_time;

  // Outputs
  wire [7:0] display_time;
  wire sound_alarm;

  // Instantiate the Unit Under Test (UUT)
  lcd_driver uut (
    .key(key),
    .alarm_time(alarm_time),
    .current_time(current_time),
    .show_alarm(show_alarm),
    .show_new_time(show_new_time),
    .display_time(display_time),
    .sound_alarm(sound_alarm)
  );

  // Testbench Stimulus
  initial begin
    // Initialize Inputs
    key = 4'b0000;
    alarm_time = 4'b0000;
    current_time = 4'b0000;
    show_alarm = 4'b0000;
    show_new_time = 0;

    // Wait 100 ns for global reset to finish
    #100;
        
    // Test Case 1: Display current time as 3
    current_time = 4'b0011; // Current time is 3
    show_alarm = 4'b0000;   // Not showing alarm time
    show_new_time = 0;      // Not showing new time
    #10;
    $display("Display Time (Current Time): %h", display_time);

    // Test Case 2: Display alarm time as 5
    alarm_time = 4'b0101;   // Alarm time is 5
    show_alarm = 4'b1111;   // Show alarm time
    show_new_time = 0;      // Not showing new time
    #10;
    $display("Display Time (Alarm Time): %h", display_time);

    // Test Case 3: Display new time via key input as 7
    key = 4'b0111;          // Key input is 7
    show_alarm = 4'b0000;   // Not showing alarm time
    show_new_time = 1;      // Show new time from key input
    #10;
    $display("Display Time (New Time): %h", display_time);

    // Test Case 4: Sound alarm when current time equals alarm time
    current_time = 4'b0101; // Set current time equal to alarm time (5)
    show_new_time = 0;      // Not showing new time
    show_alarm = 4'b0000;   // Not showing alarm time
    #10;
    $display("Sound Alarm: %b", sound_alarm);

    // Test Case 5: Test default case (Invalid digit)
    key = 4'b1010;          // Invalid digit (A)
    show_new_time = 1;      // Show new time from key input
    #10;
    $display("Display Time (Invalid): %h", display_time);

    $finish;
  end
      
endmodule

