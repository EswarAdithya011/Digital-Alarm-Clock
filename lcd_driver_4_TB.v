module lcd_driver_4_TB;

// Testbench signals
reg [3:0] alarm_time_ms_hr;
reg [3:0] alarm_time_ls_hr;
reg [3:0] alarm_time_ms_min;
reg [3:0] alarm_time_ls_min;
reg [3:0] current_time_ms_hr;
reg [3:0] current_time_ls_hr;
reg [3:0] current_time_ms_min;
reg [3:0] current_time_ls_min;
reg [3:0] key_ms_hr;
reg [3:0] key_ls_hr;
reg [3:0] key_ms_min;
reg [3:0] key_ls_min;
reg show_a;
reg show_current_time;

wire [7:0] display_ms_hr;
wire [7:0] display_ls_hr;
wire [7:0] display_ms_min;
wire [7:0] display_ls_min;
wire sound_a;

// Instantiate the lcd_driver_4 module
lcd_driver_4 uut (
    .alarm_time_ms_hr(alarm_time_ms_hr),
    .alarm_time_ls_hr(alarm_time_ls_hr),
    .alarm_time_ms_min(alarm_time_ms_min),
    .alarm_time_ls_min(alarm_time_ls_min),
    .current_time_ms_hr(current_time_ms_hr),
    .current_time_ls_hr(current_time_ls_hr),
    .current_time_ms_min(current_time_ms_min),
    .current_time_ls_min(current_time_ls_min),
    .key_ms_hr(key_ms_hr),
    .key_ls_hr(key_ls_hr),
    .key_ms_min(key_ms_min),
    .key_ls_min(key_ls_min),
    .show_a(show_a),
    .show_current_time(show_current_time),
    .display_ms_hr(display_ms_hr),
    .display_ls_hr(display_ls_hr),
    .display_ms_min(display_ms_min),
    .display_ls_min(display_ls_min),
    .sound_a(sound_a)
);

// Test cases
initial begin
    // Initialize signals
    alarm_time_ms_hr = 4'd0;
    alarm_time_ls_hr = 4'd0;
    alarm_time_ms_min = 4'd0;
    alarm_time_ls_min = 4'd0;
    current_time_ms_hr = 4'd0;
    current_time_ls_hr = 4'd0;
    current_time_ms_min = 4'd0;
    current_time_ls_min = 4'd0;
    key_ms_hr = 4'd0;
    key_ls_hr = 4'd0;
    key_ms_min = 4'd0;
    key_ls_min = 4'd0;
    show_a = 1'b0;
    show_current_time = 1'b0;

    // Wait for global reset
    #5;

    // Case 1: Display key time (e.g., 12:34)
    key_ms_hr = 4'd1;
    key_ls_hr = 4'd2;
    key_ms_min = 4'd3;
    key_ls_min = 4'd4;
    show_current_time = 1'b1;
    show_a = 1'b0;
    #10;

    // Case 2: Display alarm time (e.g., 09:59)
    alarm_time_ms_hr = 4'd0;
    alarm_time_ls_hr = 4'd9;
    alarm_time_ms_min = 4'd5;
    alarm_time_ls_min = 4'd9;
    show_a = 1'b1;
    show_current_time = 1'b0;
    #10;

    // Case 3: Display current time (e.g., 23:59)
    current_time_ms_hr = 4'd2;
    current_time_ls_hr = 4'd3;
    current_time_ms_min = 4'd5;
    current_time_ls_min = 4'd9;
    show_a = 1'b0;
    show_current_time = 1'b0;
    #10;

    // Case 4: Match current time and alarm time (e.g., 07:07)
    current_time_ms_hr = 4'd0;
    current_time_ls_hr = 4'd7;
    current_time_ms_min = 4'd0;
    current_time_ls_min = 4'd7;
    alarm_time_ms_hr = 4'd0;
    alarm_time_ls_hr = 4'd7;
    alarm_time_ms_min = 4'd0;
    alarm_time_ls_min = 4'd7;
    #10;

    // Case 5: Corner Case - Current time is 00:00 and alarm time is 00:00
    current_time_ms_hr = 4'd0;
    current_time_ls_hr = 4'd0;
    current_time_ms_min = 4'd0;
    current_time_ls_min = 4'd0;
    alarm_time_ms_hr = 4'd0;
    alarm_time_ls_hr = 4'd0;
    alarm_time_ms_min = 4'd0;
    alarm_time_ls_min = 4'd0;
    #10;

    // Case 6: Another Corner Case - Current time is 23:59 and alarm time is 23:59
    current_time_ms_hr = 4'd2;
    current_time_ls_hr = 4'd3;
    current_time_ms_min = 4'd5;
    current_time_ls_min = 4'd9;
    alarm_time_ms_hr = 4'd2;
    alarm_time_ls_hr = 4'd3;
    alarm_time_ms_min = 4'd5;
    alarm_time_ls_min = 4'd9;
    #10;

    // Finish the testbench
    $finish;
end

endmodule
