import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_flutter_app/base/providers/color_token_provider.dart';
import 'package:movie_flutter_app/localization/delegate/localization_extensions.dart';
import 'package:movie_flutter_app/presentation/base_widgets/base_text.dart';
import 'package:movie_flutter_app/presentation/pages/splash/bloc/splash_bloc.dart';
import 'package:movie_flutter_app/presentation/pages/splash/bloc/splash_state.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SplashBloc, SplashState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: context.colors.accent,
          body: GestureDetector(
            onTap: () {},
            child: Container(
              width: 300.0,
              height: 300.0,
              color: context.colors.background,
              child: Center(child: BaseText(text: context.strings.appName)),
            ),
          ),
        );
      },
    );
  }
}
