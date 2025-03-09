// Define the list of supported units
const units = ['meters', 'feet', 'kilometers', 'miles', 'inches', 'centimeters'];

// Define the conversion rates between units
final Map<String, double> conversionRates = {
  'meters_feet': 3.28084,
  'feet_meters': 0.3048,
  'meters_kilometers': 0.001,
  'kilometers_meters': 1000.0,
  'miles_kilometers': 1.60934,
  'kilometers_miles': 0.621371,
  'inches_centimeters': 2.54,
  'centimeters_inches': 0.393701,
};

/// Function to convert units based on the value, fromUnit, and toUnit.
/// Returns the conversion result as a string formatted to three decimal places,
/// or an error message if the conversion is not possible.
String? convertUnits(double value, String fromUnit, String toUnit) {
  String key = '${fromUnit}_$toUnit'; // Create a key to access the conversion rate
  double? rate = conversionRates[key]; // Lookup the conversion rate

  // If no conversion rate is found, return an error message
  if (rate == null) return 'Conversion not possible';

  // Perform the conversion and return the result formatted to 3 decimal places
  double result = value * rate;
  return result.toStringAsFixed(3);
}
