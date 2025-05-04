import 'package:flutter/material.dart';
import 'package:movie_flutter_app/domain/models/user/user_data.dart';
import 'package:movie_flutter_app/presentation/base_widgets/base_text.dart';
import 'package:movie_flutter_app/presentation/pages/settings/widgets/profile/profile_image.dart';
import 'package:movie_flutter_app/utils/constants/dimensions.dart';

class SettingsProfileLoggedIn extends StatelessWidget {
  const SettingsProfileLoggedIn({super.key, required this.user});

  final UserData user;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: Dimensions.marginExtraLarge),
      width: double.infinity,
      child: Column(
        children: [
          ProfileImage(image: user.image),
          _name(),
          _email(),
          const SizedBox(height: Dimensions.marginMedium),
        ],
      ),
    );
  }

  Widget _name() {
    final name = user.name;
    if (name == null || name.isEmpty == true) return const SizedBox();

    return Container(
      margin: const EdgeInsets.only(top: Dimensions.marginLarge),
      child: BaseText(
        text: name,
        fontSize: Dimensions.fontLarge,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  Widget _email() {
    final email = user.email;
    if (email == null || email.isEmpty == true) return const SizedBox();

    return BaseText(text: email, fontSize: Dimensions.fontMedium, height: 1.2);
  }
}
