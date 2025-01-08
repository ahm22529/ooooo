class CustomExpection implements Exception {
  final String message;
  CustomExpection(this.message);

  String toString() {
    return message;
  }
}
