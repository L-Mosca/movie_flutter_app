import 'package:movie_flutter_app/localization/strings/app_localization.dart';

class EnUs extends AppLocalization {
  @override String get appName => "Movie App";

  // Register page
  @override String get welcome => "Welcome to";
  @override String get getAllFeatures => "Sign up to access all features of the App";
  @override String get name => "Name";
  @override String get email => "Email";
  @override String get password => "Password";
  @override String get confirmPassword => "Confirm password";
  @override String get register => "Register";
  @override String get hasAccount => "Already have an account?";
  @override String get clickHere => "Click here";
  @override String get registerError => "An error occurred during registration";
  @override String get registerSuccess => "Registration completed successfully";
  @override String get emptyName => "Enter your name";
  @override String get emptyEmail => "Enter your email";
  @override String get invalidEmail => "Invalid email";
  @override String get emptyPassword => "Fill in the password fields";
  @override String get invalidPassword => "Invalid passwords";
}