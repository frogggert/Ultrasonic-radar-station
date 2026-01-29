# Ultrasonic-radar-station

Hello everyone!

Just a couple of disclaimers before I get into the technical aspects:

This is my first ever GitHub project and also my first larger programming project, so please bear with me.
Until now, I’ve only done fairly simple programming in C++ and with Arduino.

A lot of the code used in this project was created with the help of AI, and I want to be very open about that. This project was made during the same 1–2 month period in which I first learned how to program at all, so AI assistance was definitely necessary. Using the AI-generated base code, I then tweaked it to my liking and added my own features.

The Processing part was a whole other story. I had never worked with Processing before, so I let ChatGPT teach me the basics and provide a starting point. After that, I chose the sizes, shapes, colors, and general design myself.

Some people might say this is a very easy project to make, but for me, as my first big project, it came with a steep learning curve. Huge thanks to the Hack Club community for all the help, support, and motivation to actually build something like this!

Now, enough yapping on to the important stuff 

## Ultrasonic Sensor Radar

This project is a simple “radar” built using:

- An ultrasonic sensor

- A servo motor

- An Arduino

- A 3D-printed case/tower

The Arduino reads distance data from the ultrasonic sensor and sends it via the serial port to a Processing program running on the connected computer. After each reading, the servo moves one step, and the process repeats.

The Processing program reads the angle and distance values from the Arduino and visualizes them as a radar display on the screen.

(Insert picture of design here)

## Demo:
(insert link here)

## How to Use

Upload the provided Arduino code to your Arduino board.

Download Processing: (insert download link here)

Paste or open the provided Processing code in Processing.

Connect the hardware:

Servo (I used a 3-pin servo: power, ground, and PWM)

Ultrasonic sensor (insert link here)

I used pin 6 for the ultrasonic sensor and pin 3 for the servo, but any PWM pin should work.

Connect the Arduino to your PC.

Run the Processing sketch.

A window should pop up showing the radar display. Once the servo and sensor start moving, detected objects should appear on the radar screen.

## Final Notes

I’m honestly not sure what else I should add here yet 
If you have ideas, suggestions, or run into problems, feel free to leave a comment or issue wherever GitHub allows that.

And to anyone reviewing or voting on this project. I hope I could convince you! Please keep in mind that I’m still a beginner, and this project was mainly about learning and experimenting.

Thanks for checking it out!
