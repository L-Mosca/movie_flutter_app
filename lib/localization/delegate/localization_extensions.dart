import 'package:flutter/widgets.dart';
import 'package:movie_flutter_app/localization/delegate/app_localization_delegate.dart';
import 'package:movie_flutter_app/localization/strings/app_localization.dart';

extension LocalizationContextExtensions on BuildContext {
  AppLocalization get strings {
    return AppLocalizationDelegate.of(this);
  }
}

extension LocalizationStateExtensions on State {
  AppLocalization get appLocalizations {
    return context.strings;
  }
}