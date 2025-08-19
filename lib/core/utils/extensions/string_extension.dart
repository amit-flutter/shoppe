extension StringExtension on String {
  bool isTextBlank() {
    return trim() == '' || isEmpty || this == 'null' || this == 'Null';
  }

  bool containsAny(List<String> values) {
    return values.any((value) => contains(value));
  }
}
