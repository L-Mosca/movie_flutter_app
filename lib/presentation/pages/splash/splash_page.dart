import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_flutter_app/base/providers/color_token_provider.dart';
import 'package:movie_flutter_app/presentation/base_widgets/base_page.dart';
import 'package:movie_flutter_app/presentation/base_widgets/base_svg_icon.dart';
import 'package:movie_flutter_app/presentation/pages/splash/bloc/splash_bloc.dart';
import 'package:movie_flutter_app/presentation/pages/splash/bloc/splash_event.dart';
import 'package:movie_flutter_app/presentation/pages/splash/bloc/splash_state.dart';
import 'package:movie_flutter_app/router/app_router.dart';
import 'package:movie_flutter_app/utils/constants/dimensions.dart';
import 'package:movie_flutter_app/utils/constants/icons.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BasePage<SplashBloc, SplashEvent, SplashState>(
      listener: _onChange,
      builder: _builder,
    );
  }

  void _onChange(BuildContext context, SplashState state) {
    if (state.listener == SplashListener.showHome) {
      Navigator.popAndPushNamed(context, AppRouter.homeRoute);
      context.read<SplashBloc>().add(SplashResetListenerEvent());
    }
  }

  Widget _builder(BuildContext context, SplashState state) {
    return Scaffold(
      backgroundColor: context.colors.accent,
      body: _squareShape(context, child: _icon(context)),
    );
  }

  Widget _squareShape(BuildContext context, {required Widget child}) {
    return Center(
      child: Container(
        width: 120.0,
        height: 120.0,
        decoration: BoxDecoration(
          color: context.colors.primary,
          borderRadius: BorderRadius.circular(Dimensions.radiusSmall),
        ),
        child: child,
      ),
    );
  }

  Widget _icon(BuildContext context) {
    return Center(
      child: BaseSvgIcon(
        iconPath: AppIcons.appIcon,
        width: 74.0,
        height: 74.0,
        iconColor: context.colors.accent,
      ),
    );
  }
}
