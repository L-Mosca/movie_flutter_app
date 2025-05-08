import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_flutter_app/base/providers/localization_provider.dart';
import 'package:movie_flutter_app/domain/models/settings/app_locale.dart';
import 'package:movie_flutter_app/presentation/base_widgets/base_page.dart';
import 'package:movie_flutter_app/presentation/pages/settings/bloc/settings_bloc.dart';
import 'package:movie_flutter_app/presentation/pages/settings/bloc/settings_event.dart';
import 'package:movie_flutter_app/presentation/pages/settings/bloc/settings_state.dart';
import 'package:movie_flutter_app/presentation/pages/settings/widgets/options/settings_options.dart';
import 'package:movie_flutter_app/presentation/pages/settings/widgets/profile/settings_profile_content.dart';
import 'package:movie_flutter_app/presentation/pages/settings/widgets/settings_app_bar.dart';
import 'package:movie_flutter_app/router/app_router.dart';
import 'package:movie_flutter_app/utils/constants/app_constants.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BasePage<SettingsBloc, SettingsEvent, SettingsState>(
      listener: _onChange,
      builder: _builder,
    );
  }

  void _onChange(BuildContext context, SettingsState state) {
    _logoutSuccess(context, state);
    _changeLocale(context, state);
  }

  Widget _builder(BuildContext context, SettingsState state) {
    return Scaffold(
      appBar: SettingsAppBar(onBackPressed: () => Navigator.pop(context)),
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              SettingsProfileContent(user: state.user),
              SettingsOptions(
                onUseTermsPressed: _onUseTermsPressed,
                onPrivacyPoliciesPressed: _onPrivacyPoliciesPressed,
                onLocalesPressed: (data) => _onLocalesPressed(data, context),
                onSignInPressed: () => _onSignInPressed(context),
                onSignOutPressed: () => _onSignOutPressed(context),
                locale: state.selectedLocale?.languageCode ?? "pt",
                userData: state.user,
                supportedLocales: state.supportedLocales,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onUseTermsPressed() async {
    await launchUrl(Uri.parse(AppConstants.useTermsUrl));
  }

  void _onPrivacyPoliciesPressed() async {
    await launchUrl(Uri.parse(AppConstants.privacyPolicies));
  }

  void _onLocalesPressed(AppLocale locale, BuildContext context) {
    context.read<SettingsBloc>().add(SettingsSetLocaleEvent(locale: locale));
  }

  void _onSignInPressed(BuildContext context) {
    Navigator.pushNamed(context, AppRouter.loginRoute);
  }

  void _onSignOutPressed(BuildContext context) {
    context.read<SettingsBloc>().add(SettingsLogoutEvent());
  }

  void _logoutSuccess(BuildContext context, SettingsState state) {
    if (state.listener == SettingsListener.logoutSuccess) {
      Navigator.pop(context);
      context.read<SettingsBloc>().add(SettingsResetListener());
    }
  }

  void _changeLocale(BuildContext context, SettingsState state) {
    if (state.listener == SettingsListener.changeLocale) {
      context.setLocale(Locale(state.selectedLocale!.languageCode));
      WidgetsBinding.instance.addPostFrameCallback((_) {
        final list = context.buildDefaultLocaleList();
        context.read<SettingsBloc>().add(
          SettingsFetchLocaleListEvent(list: list),
        );
        context.read<SettingsBloc>().add(SettingsResetListener());
      });
    }
  }
}
