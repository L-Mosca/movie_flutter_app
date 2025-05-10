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
  @override String get nameMinChar => "Name must be at least 3 characters long";
  @override String get nameMaxChar => "Name must be at most 50 characters long";
  @override String get emptyEmail => "Enter your email";
  @override String get invalidEmail => "Invalid email";
  @override String get emptyPasswords => "Fill in the password fields";
  @override String get invalidPassword => "Invalid passwords";
  @override String get eightChar => "8 characters";
  @override String get upperLetter => "Uppercase";
  @override String get lowerLetter => "Lowercase";
  @override String get number => "Number";
  @override String get special => "Special";
  @override String get typeAllFields => "Please fill in all fields correctly";

  // Login page
  @override String get signInToContinue => "Sign in to continue";
  @override String get dontHaveAccount => "Don't have an account?";
  @override String get loginError => "Error while logging in";
  @override String get emptyPassword => "Enter a password";
  @override String get loginSuccess => "Login successful";
  @override String get or => "Or";
  @override String get login => "Login";

  // Settings Page
  @override String get settings => "Settings";
  @override String get useAllAppFeatures => "Log in to access all app features";
  @override String get useTerms => "Terms of Use";
  @override String get privacyPolicies => "Privacy Policies";
  @override String get portuguese => "Portuguese (Brazil)";
  @override String get english => "English";
  @override String get exit => "Log Out";
  @override String get wouldLikeToExit => "Do you want to log out of the app?";

  // Home Page
  @override String get searchMovie => "Search movie";
  @override String get movieNotFound => "No movie found";
  @override String get nonMatchResponse => "It looks like no results were found for:";
  @override String get anErrorOccurred => "An error occurred";
  @override String get fetchMovieError => "An error occurred while trying to fetch your movies. Please try again later";
  @override String get reload => "Reload";

  // Movie Detail
  @override String get duration => "Duration";
  @override String get director => "Director";
  @override String get trailer => "Trailer";
  @override String get casting => "Cast";

}