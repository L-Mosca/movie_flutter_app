

class AppConstants {
  AppConstants._();

  // Duration
  static const Duration snackBarShortDuration = Duration(milliseconds: 2000);
  static const Duration snackBarLongDuration = Duration(milliseconds: 3500);
  static const Duration toastShortDuration = Duration(milliseconds: 2000);
  static const Duration toastLongDuration = Duration(milliseconds: 3500);
  static const Duration defaultAnimationDuration = Duration(milliseconds: 300);
  static const Duration defaultPageAnimationDuration = Duration(milliseconds: 300);
  static const Duration shimmerDefaultDuration = Duration(milliseconds: 1400);

  // Regex
  static RegExp emailRegex = RegExp(
    r"^[a-zA-Z0-9.a-zA-Z0-9!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
  );

  // Settings Constants
  static const String useTermsUrl = "https://pub.dev/packages/url_launcher";
  static const String privacyPolicies = "https://pub.dev/packages/url_launcher/example";
  static const String portugueseCode = "pt";
  static const String englishCode = "en";
}
