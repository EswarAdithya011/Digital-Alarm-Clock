# ⏰ Digital Alarm Clock
## Overview

The Digital Alarm Clock project is a Verilog-based implementation of a functional digital alarm clock. This project serves as a practical application of digital design principles, offering features such as real-time timekeeping, alarm setting capabilities, and an interface for LCD display. It is designed to operate on FPGA platforms, providing hands-on experience in hardware description languages and digital system design.

## Project Description

This project involves designing and implementing a digital alarm clock using Verilog, a hardware description language commonly used in digital circuit design. The alarm clock includes the following key components:

- **Real-Time Clock (RTC) Module:** Maintains accurate time by counting seconds, minutes, and hours.
- **Alarm Module:** Allows users to set and manage alarm times, triggering alerts when the current time matches the set alarm.
- **LCD Controller:** Manages the display of time and alarm information on an LCD screen, providing a user-friendly interface.
- **User Interface Controls:** Enables user interactions such as setting the time and alarm through buttons or switches.

The project is structured to facilitate simulation and testing, with test benches provided for each module to verify functionality. Simulation results and waveform analyses are included to demonstrate the correct operation of the alarm clock.

This project is ideal for individuals seeking to deepen their understanding of digital design and FPGA-based system implementation. 

## Table of Contents

- [Overview](#overview)
- [Project Description](#Project-Description)
- [Features](#Features)
- [Installation](#installation)
- [Usage](#usage)
- [Project Structure](#project-structure)
- [Contributing](#contributing)
- [License](#license)
- [Acknowledgments](#acknowledgments)

Apologies for the earlier confusion. Here's the **Features** section formatted with navigable links, as per your request:

## Features

- [**Real-Time Clock (RTC):**](#real-time-clock-rtc) Maintains accurate timekeeping in a 24-hour format.
- [**Alarm Functionality:**](#alarm-functionality) Allows users to set and manage alarms, triggering alerts when the current time matches the set alarm time.
- [**LCD Display Interface:**](#lcd-display-interface) Provides a user-friendly interface by displaying time and alarm settings on an LCD screen.
- [**User Interaction:**](#user-interaction) Enables users to set the current time and alarm time, and to stop the alarm through buttons or switches.

### Real-Time Clock (RTC)

The RTC module ensures precise timekeeping by counting seconds, minutes, and hours in a 24-hour format. It serves as the core component of the digital alarm clock, maintaining continuous and accurate time.

### Alarm Functionality

Users can set specific alarm times using the alarm module. When the current time matches the set alarm time, the system triggers an alert, notifying the user as per the configured settings.

### LCD Display Interface

The LCD controller manages the display of current time and alarm settings on an LCD screen. This interface enhances user experience by providing clear and real-time visual feedback.

### User Interaction

The system includes user interface controls, such as buttons or switches, allowing users to set the current time, configure alarm times, and deactivate alarms. These controls facilitate seamless interaction with the digital alarm clock.

​Apologies for the earlier formatting issue. Here's the corrected **Installation** section for your Digital Alarm Clock project, including a direct link to the video tutorial:

## Installation

To set up the Digital Alarm Clock project, follow these steps:

1. **Clone the Repository:**

   Open your terminal or command prompt and execute:

   ```bash
   git clone https://github.com/EswarAdithya011/Digital-Alarm-Clock.git
   ```

2. **Navigate to the Project Directory:**

   Move into the project's directory:

   ```bash
   cd Digital-Alarm-Clock
   ```

3. **Install Required Software:**

   Ensure that the following software tools are installed on your system:

   - **Intel Quartus Prime:** This FPGA development software is essential for compiling and synthesizing your Verilog designs.

     - **Installation Guide:** Refer to the [Intel Quartus Prime Pro Edition User Guide: Getting Started](https://cdrdv2-public.intel.com/790425/ug-683463-790425.pdf) for detailed installation instructions.

   - **ModelSim (Intel FPGA Edition):** A simulation tool used to verify the functionality of your Verilog code.

     - **Installation Guide:** Detailed instructions are available in the [ModelSim Intel FPGA Edition: Installation and setup guide](https://www.youtube.com/watch?v=C5J_G7qcfm4).

     - **Video Tutorial:** For a step-by-step walkthrough, watch the following video:

       [ModelSim Intel FPGA Edition: Installation and setup guide](https://www.youtube.com/watch?v=C5J_G7qcfm4)

   Ensure that both tools are correctly installed and configured before proceeding.

4. **Open the Project in Quartus Prime:**

   - Launch Intel Quartus Prime.

   - Navigate to **File > Open Project**.

   - Select the `Digital-Alarm-Clock.qpf` file located in the project directory.

5. **Compile the Design:**

   - In Quartus Prime, click on **Processing > Start Compilation**.

   - Wait for the compilation process to complete. Ensure there are no errors before proceeding.

6. **Simulate the Design (Optional but Recommended):**

   - Open ModelSim.

   - Load the compiled design to simulate and verify its functionality.

   - For guidance on using ModelSim, consult the [ModelSim SE 6.6b Installation and Licensing Guide](https://manualzz.com/doc/html/6982033/mentor-graphics-se-6.6b-modelsim-installation-and-licensi...).

7. **Program the FPGA:**

   - Connect your FPGA development board to your computer.

   - In Quartus Prime, navigate to **Tools > Programmer**.

   - Add the compiled `.sof` file and click **Start** to program the FPGA.

By following these steps, you will have successfully set up and programmed the Digital Alarm Clock on your FPGA development board. 

## Usage

To effectively utilize the Digital Alarm Clock on your FPGA development board, follow these steps:

1. **Power On the FPGA Board:**

   Ensure that your FPGA development board is properly connected to a power source and powered on.

2. **Set the Current Time:**

   - **Activate Time Setting Mode:**

     Press the designated 'Set Time' button or switch to enter the time-setting mode.

   - **Adjust Hours and Minutes:**

     Use the 'Hour' and 'Minute' buttons or switches to incrementally set the correct current time.

   - **Confirm and Exit:**

     Press the 'Set Time' button again to save the settings and return to the standard display mode.

3. **Set the Alarm Time:**

   - **Activate Alarm Setting Mode:**

     Press the 'Set Alarm' button or switch to enter the alarm-setting mode.

   - **Adjust Alarm Hours and Minutes:**

     Utilize the 'Hour' and 'Minute' buttons or switches to set the desired alarm time.

   - **Confirm and Exit:**

     Press the 'Set Alarm' button once more to save the alarm settings and return to the standard display mode.

4. **Enable or Disable the Alarm:**

   - **Toggle Alarm Activation:**

     Use the 'Alarm On/Off' switch to enable or disable the alarm functionality as needed.

5. **Alarm Activation:**

   - **Alarm Trigger:**

     When the current time matches the set alarm time, the alarm will activate, producing an audible or visual alert.

   - **Deactivate Alarm:**

     Press the 'Alarm Off' or 'Snooze' button to silence the alarm.

6. **LCD Display:**

   - **Time Display:**

     The LCD screen continuously displays the current time in a 24-hour format.

   - **Alarm Status:**

     The LCD may also indicate the status of the alarm, such as the set time and whether it is enabled or disabled.

**Note:** The specific buttons or switches for each function may vary depending on your FPGA board's configuration. Consult your board's manual or the project's documentation for precise details.

By following these instructions, you can effectively operate the Digital Alarm Clock implemented on your FPGA development board. 
