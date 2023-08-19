# ***4-BIT-Johnson-Counter***
## ***Introduction***
This project presents the design and implementation of a 4-bit Johnson counter using D flip-flops with asynchronous reset. The Johnson counter is a type of digital sequential circuit known for its unique characteristic of generating a continuous cyclic sequence of binary values. The objective of this project is to develop a 4-bit Johnson counter capable of producing the expected sequence: 0000, 1000, 1100, 1110, 1111, 0111...., 0001.

Verilog hardware description language is employed for the implementation. Additionally, a test bench based on Object-Oriented Programming (OOP) is developed to validate the counter's behavior, treating the design as a black box, enabling representation and simulation of the counter's behavior.

In conclusion, the proposed 4-bit Johnson counter will successfully generate the expected cyclic sequence of binary values. The report demonstrates the effectiveness of the proposed design and highlights the significance of asynchronous reset in ensuring reliable operation. The project contributes to a deeper understanding of digital sequential circuits and their applications in various digital systems.

## ***What is a Johnson Counter***
Johnson counters, also known as twisted ring counters, are a fundamental class of digital sequential circuits widely used in various electronic applications. These counters are particularly significant in digital circuit design due to their ability to generate a continuous cyclic sequence of binary values, making them valuable components in signal generation, pattern recognition, and control systems.

A Johnson counter circulates a sequence of ones and zeros in a continuous loop, with only one bit changing its state at a time. This sequential nature and cyclic behavior make Johnson counters well-suited for applications where controlled and predictable sequencing is essential. The motivation behind this endeavor lies in the importance of sequential circuits in modern digital systems. Johnson counters offer unique advantages, such as simplicity and the generation of cyclic patterns, making them suitable for a range of applications where repetitive sequences are required. They can be easily constructed using flip-flops or shift registers, making them popular choices in many electronic projects, such as frequency dividers, LED chasers, and other control and automation systems.

Compared to traditional binary counters, Johnson counters can produce twice as many unique count states using the same number of D Flip-Flops. This makes them highly effective in generating a larger number of distinct sequences within a limited number of bits. Their unique properties and operation make them a versatile choice in various digital system designs and applications.

## ***Design and Implementation***
### ***Johnson counter block diagram*** ###
![image](https://github.com/tusharshenoy/4-BIT-Johnson-Counter/assets/107348474/fefaf196-136c-4170-9703-5166b8c52faf) <br>

### ***Johnson counter state diagram*** ###
![image](https://github.com/tusharshenoy/4-BIT-Johnson-Counter/assets/107348474/dd3a528c-560e-4dd7-ae40-6ed0b7cf7d88)

## ***Tech Stack***
[Vivado ML Edition - 2023.1](https://www.xilinx.com/support/download/index.html/content/xilinx/en/downloadNav/vivado-design-tools/2023-1.html) used to implement the code and [draw.io]([draw.io](https://app.diagrams.net/)) website to design the circuit.

## ***Working***

The working of an asynchronous Johnson counter involves the cyclic generation of binary values using D flip-flops with asynchronous reset. The step-by-step operation of the counter is given below:

1.	Initialization:
•	When the asynchronous reset signal is asserted (active-high), all flip-flops in the counter are asynchronously reset to their initial state, which is typically 0000 for a 4-bit Johnson counter.
•	This ensures that the counter starts from a known state, providing a reliable starting point for the cyclic sequence.

2.	Clock Triggered Operation:
•	After initialization, the Johnson counter starts counting based on the clock signal.
•	At each rising edge of the clock signal, the binary value stored in the counter shifts one position.
•	The output of each flip-flop is connected to the D input of the next flip-flop, creating a feedback loop that enables the shift behaviour.

3.	Cyclic Sequence Generation:
•	As the clock pulses, the counter generates a continuous cyclic sequence of binary values.
•	The sequence begins with the initial state 0000 and progresses through subsequent states following a specific pattern.
•	For a 4-bit Johnson counter, the sequence proceeds as: 0000, 1000, 1100, 1110, 1111, 0111....
•	After reaching the value 0001, the counter wraps around to the initial state 0000, and the cyclic sequence repeats.
4.	Shift Operation:
•	The shifting operation occurs due to the feedback connections between the flip-flops.
•	During each clock cycle, the MSB flip-flop's inverted output is fed back to the LSB flip-flop's D input.
•	This shift action causes the binary value stored in the counter to shift one position, generating the next value in the cyclic sequence.

5.	Asynchronous Reset Handling:
•	The asynchronous reset ensures a predictable start for the cyclic sequence.
•	If the asynchronous reset signal is asserted at any point, all flip-flops are immediately reset to their initial state.
•	This feature is vital to provide a reliable and controlled initialization of the counter, preventing any ambiguity during the start-up phase.

![image](https://github.com/tusharshenoy/4-BIT-Johnson-Counter/assets/107348474/e6b54667-ae5f-41c6-afa3-34fde4f3ff9e)

![image](https://github.com/tusharshenoy/4-BIT-Johnson-Counter/assets/107348474/284bfb7d-01f1-4bdb-be2e-5e2e4a0786b9)

![image](https://github.com/tusharshenoy/4-BIT-Johnson-Counter/assets/107348474/f730a892-fc21-4a80-8a03-3455d990ad52)
<br>

##	***Working of Code*** ##

The code's operation is described in detail below.

•	D Flip Flop Code:
This module represents a D flip-flop, which is a basic memory element used in the circuit. It has a single data input ‘D’, an asynchronous reset input ‘reset’, and a clock input ‘clk’. The outputs are Q and ‘Qb’ (complement output). The behavior of the d flip-flop is defined within the always block. It is sensitive to the clock's rising edge ‘posedge clk’ and the reset signal's rising edge ‘posedge reset’. When the reset is asserted, the output Q is set to 0. Otherwise, when the clock's rising edge occurs, the flip-flop stores the input D value into Q, and Qb is set as the complement of Q.

•	Structural Johnson Counter Code:
This module indicates a 4-bit Johnson counter a type of shift register. The counter is built with four instances of D flip-flop module. It has two input ports ‘clk’ for clock signal and ‘reset’ for rest signal. The output port ‘Q’ is 4-bit representing the 4-bit output of Johnson counter. This code instantiates four D flip flops that are interconnected. The first flip flop takes the complement of the output of fourth flip flop as its input ‘D’. For the next three flip flops the output ‘Q’ of previous is connected as input forming the feedback loop. The ‘clock’ and ‘reset’ signal is same for all D flip-flops. The Johnson counter will start from an initial state (all zeros) and will keep cycling through the specific sequence as the clock signal keeps toggling. The output ‘Q’ will show the 4-bit value corresponding to the current state of the Johnson counter.

•	Johnson Counter Code using OOP:
This code defines a package named ‘jc_pkg’ encapsulating the class ‘JohnsonCounter’. The class consists three data members:  4-bit register ‘q’ to store the current input data of the counter, clock signal ‘clk’ and reset signal ‘reset’. Next, the code consists of constructor function for the created class which takes two input arguments ‘clk1’ and ‘reset1’ which initializes the ‘clk’ and ‘reset’ data members respectively. The logic function block is responsible for updating the state of Johnson counter based on the clock signal and reset condition. The ‘performLogic’ function updates the counter’s state at each clock cycle. If reset==1 then ‘q’ is set to 4’b0000 otherwise the ‘q’ is updated to next state of the Johnson counter. The output function block (‘getOutput’) is used to obtain the current state of Johnson counter in the output variable ‘out’. If the reset is not asserted then the value ‘q’ is assigned to ‘out’. 

•	Testbench using OOP:
The testbench is used to validate the functionality of the Johnson counter design under various test conditions. At first, testbench module is declared, and it imports a package named ‘jc_pkg’. The package includes some parameter definitions. The test bench declares ‘clk’, ‘reset’, 4 bit ‘out’, 4 bit ‘Q’ signals. ‘Q’ used to store the actual output of the Johnson counter from DUT. ‘JohnsonCounter jc’ is an instance of the ‘JohnsonCounter’ module that uses the input signals ‘clk’ and ‘reset’ to determine the expected output of the Johnson counter. ‘Johnson_Counter_4bit dut’ is an instance of the design under test (DUT) ‘Johnson_Counter_4bit’, which represents the 4-bit Johnson counter to be tested. The ‘Q’ signal is connected to get the output of the DUT.
In the ‘initial block’ the ‘clk’ and ‘reset’ signal are initialized. The testbench asserts the reset signal (reset = 1'b1) for 8-time units and then de-asserts it (reset = 1'b0). The clock is toggled with a period of 5-time units using the ‘repeat’ loop. The always block is triggered on the positive edges of both the clock and the reset signals. Inside the block, the 'performLogic' method of the 'JohnsonCounter' module is called with the reset signal as an argument to calculate the expected Johnson counter output. The 'getOutput' method of the 'JohnsonCounter' module is called to obtain the expected Johnson counter output, which is stored in the 'out' signal. The ‘$display’ function is used to print the expected and actual output of the Johnson counter.
The testbench code includes various initial blocks which is used to test different cases and ‘$display’ function is used to print the result of each test cases.The test cases to verify the functionality of the Johnson counter in different scenarios is performed as below:

	Test case 1 - Basic functionality with no reset:
This test case checks the basic functionality of the Johnson counter without using any reset signal. The counter should cycle through its states continuously. 

	Test case 2 - Counter with reset:
This test case starts by asserting the reset signal that is setting it to 1 and then de-asserts the reset that is setting it to 0. The counter should count after the reset is de-asserted

	Test case 3 - Test with un-occurred combination (1010):
In this test, the output of the counter (out) and the expected output (Q) are set to the value 1010 (10 in decimal). The test bench verifies that the counter continuous in the sequence.

	Test case 4 - Clock toggle failure:
This test case checks for clock toggle failure. This test helps to ensure that the clock toggling mechanism is functioning correctly.
The test bench compares the counter's outputs (Q) with the expected output (out) to make sure the counter works correctly. 

The Object-Oriented Programming testbench makes it easier to maintain and add new features to it because of its organized and clear structure.

##	***Results and Discussion*** ##

This project demonstrates the design and implementation of the ‘4-bit Johnson counter using D-flip flops' in the form of Verilog code. The counter includes an asynchronous reset feature. It successfully generates a cyclic sequence of binary values: 0000, 1000, 1100, 1110, 1111, 0111....The counter's operation is driven by the clock signal, ensuring synchronous updates of the binary states. With an asynchronous reset capability, it initializes reliably to 0000 when the reset signal is asserted, providing a well-defined starting point for the cyclic sequence. Various test cases were also performed to check the functionality of the designed code.

### ***Waveform*** ###
![image](https://github.com/tusharshenoy/4-BIT-Johnson-Counter/assets/107348474/a6d0f3ce-443d-4097-ae1a-591b0df40f15)


##	***Conclusion*** ##

In conclusion, the designed code shows the implementation of ‘4-bit Johnson counter using D-flip flops' in SystemVerilog, demonstrating two different design approaches- structural and object-oriented programming (OOP).The design highlights the adaptability of SystemVerilog as a hardware description language, allowing designers to select several design styles depending on their project requirements. The functionality of Johnson counter is encased using OOP, resulting in clearer and more maintainable code. The test bench tests the correct operation of the counter, ensuring that it behaves as expected. The testing, debugging, and simulation of 4-bit Johnson counter is done in Vivado software. The Software is used to validate the design, fix issues, and ensure its accuracy. The project resulted in the successful development of a functional 4-bit Johnson counter. The 4-bit Johnson counter serves as an important building block for more complex digital circuits and provides a valuable opportunity to gain a deeper understanding of sequential logic and Verilog design approaches.

##	***References*** ##

[1] Javatpoint. "Johnson Counter Circuit." Available at:    https:[//www.javatpoint.com/johnson-counter-in-digital-electronics](//www.javatpoint.com/johnson-counter-in-digital-electronics)

[2] Electronics Tutorials. "Sequential Circuits - Johnson Ring Counter." Available at: https:[//www.electronics-tutorials.ws/sequential/seq_6.html](//www.electronics-tutorials.ws/sequential/seq_6.html)

[3] "Digital Counters - Johnson Ring and More." Available at: https:[//www.circuitsgallery.com/digital-counters-johnson-ring-and-more/](//www.circuitsgallery.com/digital-counters-johnson-ring-and-more/)

[4] ChipVerify: Counters. "Verilog Johnson Counter." Available at: https:[//www.chipverify.com/verilog/verilog-johnson-counter](//www.chipverify.com/verilog/verilog-johnson-counter)

[5] BrainKart. "Johnson Ring Counter." Available at: https:[//www.brainkart.com/article/Johnson-Ring-Counter_12979/](//www.brainkart.com/article/Johnson-Ring-Counter_12979/)




