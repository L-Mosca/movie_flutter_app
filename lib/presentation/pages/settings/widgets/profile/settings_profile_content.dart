import 'package:flutter/material.dart';
import 'package:movie_flutter_app/domain/models/user/user_data.dart';
import 'package:movie_flutter_app/presentation/base_widgets/base_line.dart';
import 'package:movie_flutter_app/presentation/pages/settings/widgets/profile/settings_profile_logged_in.dart';
import 'package:movie_flutter_app/presentation/pages/settings/widgets/profile/settings_profile_logged_out.dart';
import 'package:movie_flutter_app/utils/constants/dimensions.dart';

class SettingsProfileContent extends StatelessWidget {
  const SettingsProfileContent({super.key, this.user});

  final UserData? user;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (user == null) SettingsProfileLoggedOut(),
        if (user != null) SettingsProfileLoggedIn(user: user!),
        BaseLine(
          enableShadows: false,
          margin: EdgeInsets.only(
            left: Dimensions.marginLarge,
            right: Dimensions.marginLarge,
            bottom: Dimensions.marginExtraLarge,
          ),
        ),
      ],
    );
  }
}
