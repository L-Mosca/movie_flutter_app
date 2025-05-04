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

  AppLocale.fromJson(Map<String, dynamic> json)
    : country = json["country"],
      languageCode = json["languageCode"];

  Map<String, dynamic> toJson() {
    final data = <String, dynamic> {};
    data["country"] = country;
    data["languageCode"] = languageCode;
    return data;
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

extension LanguageCodeExtensions on String {
  String getLanguage(BuildContext context) {
    switch(this) {
      case AppConstants.portugueseCode : return context.strings.portuguese;
      case AppConstants.englishCode : return context.strings.english;
      default: return context.strings.portuguese;
    }
  }
}
