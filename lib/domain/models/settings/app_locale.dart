import 'package:flutter/material.dart';
import 'package:movie_flutter_app/localization/delegate/localization_extensions.dart';
import 'package:movie_flutter_app/utils/constants/app_constants.dart';

class AppLocale {
  String country;
  String languageCode;

  AppLocale({required this.country, required this.languageCode});

  @override
  String toString() {
    return 'AppLocale{country: $country, languageCode: $languageCode}';
  }
}

extension AppLocaleExtensions on BuildContext {
  List<AppLocale> buildDefaultLocaleList() {
    return <AppLocale>[
      AppLocale(
        country: strings.english,
        languageCode: AppConstants.englishCode,
      ),
      AppLocale(
        country: strings.portuguese,
        languageCode: AppConstants.portugueseCode,
      ),
    ];
  }
}
