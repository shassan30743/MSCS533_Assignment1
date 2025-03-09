import 'package:flutter/material.dart'; // Import Flutter material design package
import './screen/converter_screen.dart'; // Import the converter screen

void main() {
  runApp(const MyApp()); // Entry point for the app, launching the MyApp widget
}

/// The main application widget that represents the overall structure of the app.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Measures Converter', // Application title
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple), // Define the theme's color scheme
        useMaterial3: true, // Use Material Design 3 standards
      ),
      home: const ConverterScreen(title: 'Measures Converter'), // Set the initial screen of the app
    );
  }
}
