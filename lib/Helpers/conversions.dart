double convertToDouble(dynamic value) {
  if (value is int) {
    return value.toDouble();
  } else if (value is double) {
    return value;
  } else {
    // Handle the case where 'value' is not a valid numeric value.
    return 0.0; // Set a default value or handle the error as needed.
  }
}
