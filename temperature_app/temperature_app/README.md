Temperature Converter App
A simple Flutter application that converts temperatures between Celsius and Fahrenheit.

Features
Input temperature in Celsius or Fahrenheit.
Switch between input units using radio buttons.
Display the converted temperature in a dialog box.

Requirements
Flutter SDK
Dart SDK

clone repository: https://github.com/jmukamani/Navigation-and-Routing.git
cd temperature_app/temperature_app

Run the application: flutter run

Code Explanation
main.dart
The entry point of the application. It contains the MyApp class which sets up the main application theme and home screen.

MyApp Class
This stateless widget sets up the MaterialApp and specifies TempApp as the home widget.

TempApp Class
This stateful widget manages the state of the temperature conversion application by creating an instance of TempState.

TempState Class
This class contains the logic and UI for the temperature conversion.

Variables:

input: Holds the input temperature.
output: Holds the converted temperature.
fOrC: A boolean that determines if the input is in Fahrenheit (false) or Celsius (true).
Methods:

initState(): Initializes the state variables.
build(): Builds the UI, including:
A TextField for input.
Radio buttons for selecting the input unit.
A button to calculate the converted temperature and display it in an AlertDialog.

UI Components
TextField: For user input.
Radio Buttons: For unit selection (Fahrenheit or Celsius).
ElevatedButton: To trigger the conversion and display the result.

Acknowledgments
Flutter documentation: flutter.dev
Dart documentation: dart.dev