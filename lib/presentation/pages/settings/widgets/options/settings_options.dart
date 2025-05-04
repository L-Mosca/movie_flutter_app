import 'package:flutter/material.dart';
import 'package:movie_flutter_app/domain/models/settings/app_locale.dart';
import 'package:movie_flutter_app/domain/models/user/user_data.dart';
import 'package:movie_flutter_app/presentation/pages/settings/widgets/options/settings_locale_option.dart';
import 'package:movie_flutter_app/presentation/pages/settings/widgets/options/settings_login_option.dart';
import 'package:movie_flutter_app/presentation/pages/settings/widgets/options/settings_logout_option.dart';
import 'package:movie_flutter_app/presentation/pages/settings/widgets/options/settings_privacy_policies_option.dart';
import 'package:movie_flutter_app/presentation/pages/settings/widgets/options/settings_use_terms_option.dart';
import 'package:movie_flutter_app/utils/constants/dimensions.dart';

class SettingsOptions extends StatelessWidget {
  const SettingsOptions({
    super.key,
    required this.onUseTermsPressed,
    required this.onPrivacyPoliciesPressed,
    required this.onLocalesPressed,
    required this.onSignInPressed,
    required this.onSignOutPressed,
    required this.locale,
    this.userData,
    required this.supportedLocales,
  });

  final void Function() onUseTermsPressed;
  final void Function() onPrivacyPoliciesPressed;
  final void Function(AppLocale) onLocalesPressed;
  final void Function() onSignInPressed;
  final void Function() onSignOutPressed;
  final String locale;
  final UserData? userData;
  final List<AppLocale> supportedLocales;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: Dimensions.marginLarge),
      child: Column(
        children: [
          SettingsUseTermsOption(onPressed: onUseTermsPressed),
          const SizedBox(height: Dimensions.marginMedium),
          SettingsPrivacyPoliciesOption(onPressed: onPrivacyPoliciesPressed),
          const SizedBox(height: Dimensions.marginMedium),
          SettingsLocaleOption(
            onLocaleSelected: onLocalesPressed,
            locale: locale,
            list: supportedLocales,
          ),
          const SizedBox(height: Dimensions.marginLarge),
          if (userData == null) SettingsLoginOption(onPressed: onSignInPressed),
          if (userData != null)
            SettingsLogoutOption(onPressed: onSignOutPressed),
        ],
      ),
    );
  }
}
