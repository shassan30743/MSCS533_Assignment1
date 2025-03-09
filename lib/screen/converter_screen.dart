import 'package:flutter/material.dart'; // Import Flutter material design package
import '../utils/conversion_logic.dart'; // Import the conversion logic
import '../widgets/conversion_result.dart'; // Import the widget that displays the result

/// A stateful widget to handle the conversion screen where users input values and view results.
class ConverterScreen extends StatefulWidget {
  final String title; // Title of the screen
  const ConverterScreen({super.key, required this.title});

  @override
  State<ConverterScreen> createState() => _ConverterScreenState();
}

class _ConverterScreenState extends State<ConverterScreen> {
  // Controllers and variables to manage user input and conversion result
  final TextEditingController _valueController = TextEditingController(); // Controller for input value
  String _fromUnit = 'meters'; // Default 'from' unit
  String _toUnit = 'feet'; // Default 'to' unit
  String? _conversionResult; // Holds the conversion result
  String? _errorText; // Holds error messages for invalid input

  /// Converts the input value based on selected units.
  void _convert() {
    setState(() {
      _errorText = null;
      _conversionResult = null;

      // Try to parse the input value into a double, show error if invalid
      double? inputValue = double.tryParse(_valueController.text);

      if (inputValue == null) {
        _errorText = 'Please enter a valid number'; // Display error if input is not a valid number
        return;
      }

      // Perform the unit conversion and store the result
      _conversionResult = convertUnits(inputValue, _fromUnit, _toUnit);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary, // Use theme's inverse primary color for app bar
        title: Text(widget.title), // Display the screen title
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0), // Add padding around the screen content
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Input field for value
            Text('Value', style: TextStyle(fontSize: 18.0)),
            TextField(
              controller: _valueController,
              decoration: InputDecoration(
                hintText: 'Enter value to convert',
                errorText: _errorText, // Show error message if there's any
              ),
              keyboardType: TextInputType.number, // Use numeric keyboard
            ),
            SizedBox(height: 16.0), // Add spacing between widgets

            // Dropdown for 'from' unit selection
            Text('From', style: TextStyle(fontSize: 18.0)),
            DropdownButton<String>(
              value: _fromUnit,
              items: units.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value), // Display unit options
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _fromUnit = newValue!; // Update 'from' unit selection
                });
              },
            ),
            SizedBox(height: 16.0),

            // Dropdown for 'to' unit selection
            Text('To', style: TextStyle(fontSize: 18.0)),
            DropdownButton<String>(
              value: _toUnit,
              items: units.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value), // Display unit options
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _toUnit = newValue!; // Update 'to' unit selection
                });
              },
            ),
            SizedBox(height: 16.0),

            // Button to trigger the conversion
            Center(
              child: ElevatedButton(
                onPressed: _convert, // Call the conversion method on button press
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15), // Customize button padding
                ),
                child: Text('Convert'), // Button label
              ),
            ),
            SizedBox(height: 16.0),

            // Display the conversion result if available
            if (_conversionResult != null)
              ConversionResult(
                value: _valueController.text, // Input value
                fromUnit: _fromUnit, // From unit
                toUnit: _toUnit, // To unit
                result: _conversionResult!, // Converted result
              ),
          ],
        ),
      ),
    );
  }
}
