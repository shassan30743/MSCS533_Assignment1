# assignment_1_app

The provided code implements a unit conversion application using **Flutter**. Here's a step-by-step explanation of how the code runs and meets the requirements:

### **1. Entry Point (`main.dart`)**
- **`main.dart`** is the entry point of the application. The `main()` function initializes the app by calling `runApp()`, which in turn runs the `MyApp` widget.
- **`MyApp` widget**:
  - The `MyApp` widget is a stateless widget that defines the overall structure of the app.
  - It sets the title of the app to "Measures Converter."
  - The app uses a **Material Design** theme (specifically Material 3) with a color scheme based on a deep purple seed color.
  - The **home screen** of the app is set to `ConverterScreen`.

### **2. Unit Conversion Screen (`converter_screen.dart`)**
This file handles the main functionality of the app, where users input values and select units to perform a conversion.

#### **Components of `ConverterScreen`:**
- **Stateful Widget**: 
  - The `ConverterScreen` widget is stateful, meaning it can hold and modify data during its lifecycle. This is important because user input and conversion results will change during app usage.
  
#### **Key Elements:**
1. **Input Field**:
   - A `TextField` allows users to input a numeric value. The entered value is managed by the `_valueController`.
   - **Validation**: If the entered value is not a valid number, the app shows an error message, "Please enter a valid number."

2. **Dropdowns for Units**:
   - Two dropdowns let users choose units for conversion:
     - **`_fromUnit`**: The unit to convert from (e.g., meters).
     - **`_toUnit`**: The unit to convert to (e.g., feet).
   - These dropdowns are populated with options like "meters", "feet", "kilometers", etc., from the `units` list.

3. **Conversion Button**:
   - The **Convert button** triggers the `_convert()` function when clicked.
   - The `_convert()` function:
     - Checks if the input is a valid number.
     - Calls the `convertUnits()` function (from `conversion_logic.dart`) to perform the actual conversion.
     - Updates the state to either show the conversion result or display an error if the input is invalid.

4. **Displaying the Result**:
   - If the conversion is successful, the result is displayed using a custom widget, `ConversionResult`.
   - This widget shows the input value, the units (from and to), and the result.

### **3. Conversion Logic (`conversion_logic.dart`)**
This file contains the core logic for converting units.

#### **Key Elements:**
- **List of Units**:
  - The app supports units like "meters", "feet", "kilometers", etc. These are stored in the `units` list.

- **Conversion Rates**:
  - A map, `conversionRates`, stores the conversion factors between various units. For example:
    - 1 meter = 3.28084 feet.
    - 1 kilometer = 0.621371 miles.

- **`convertUnits()` Function**:
  - This function takes three parameters:
    1. **`value`**: The numeric value to be converted (input by the user).
    2. **`fromUnit`**: The unit to convert from.
    3. **`toUnit`**: The unit to convert to.
  - It constructs a **key** by combining the `fromUnit` and `toUnit` (e.g., "meters_feet") and looks it up in the `conversionRates` map.
  - If a conversion rate exists for that pair of units, it performs the conversion and returns the result formatted to 3 decimal places.
  - If no conversion is possible (e.g., trying to convert incompatible units like "meters" to "inches"), it returns an error message: "Conversion not possible."

---

### **How the App Works (Flow):**

1. **Launch**:
   - The app starts, displaying the `ConverterScreen` as the home screen.

2. **User Interaction**:
   - The user enters a value to convert (e.g., 5 meters).
   - The user selects a **"from" unit** (e.g., meters) and a **"to" unit** (e.g., feet) from the dropdown menus.

3. **Conversion**:
   - The user presses the **Convert button**.
   - The app checks if the input is valid:
     - If invalid, an error message is shown.
     - If valid, the app uses the `convertUnits()` function to perform the conversion based on predefined conversion rates.
     - The result is shown below the Convert button (e.g., "5 meters is 16.404 feet").

4. **Display the Result**:
   - The result is displayed in the `ConversionResult` widget, showing the input value, units, and the result.

---

### **Meeting the Requirements:**
- **Unit Conversion**: The app successfully converts between different units like meters, feet, kilometers, and miles using predefined conversion rates.
- **Input Validation**: It ensures that users input valid numeric values, and shows error messages for invalid inputs.
- **User Interface**: The app uses a clean, responsive UI with Material Design principles, ensuring a good user experience.
- **Flexibility**: Users can easily select different units for conversion, and the app supports multiple conversions between various unit types.

This structure ensures the app performs unit conversions efficiently and provides feedback to the user in case of errors or invalid input.

## Flutter Help

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
