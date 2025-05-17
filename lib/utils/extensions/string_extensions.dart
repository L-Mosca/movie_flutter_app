extension StringExtensions on String? {
  bool hasData() => this != null && this?.isNotEmpty == true;
}
