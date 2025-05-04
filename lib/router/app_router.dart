import 'package:flutter/widgets.dart';
import 'package:movie_flutter_app/router/routes/home/home_router.dart';
import 'package:movie_flutter_app/router/routes/register/register_router.dart';
import 'package:movie_flutter_app/router/routes/splash/splash_router.dart';
import 'package:movie_flutter_app/utils/constants/app_constants.dart';

enum RouteAnimation { rightToLeft, fade, scale }

class AppRouter {
  // Routes constants
  static const splashRoute = "/";
  static const homeRoute = "/home";
  static const registerRoute = "/register";

  static Route<dynamic>? onGenerateRoute(
    RouteSettings settings,
    BuildContext context,
  ) {
    switch (settings.name) {
      case splashRoute:
        return _buildPageWithAnimation(SplashRouter.page);
      case homeRoute:
        return _buildPageWithAnimation(HomeRouter.page);
      case registerRoute:
        return _buildPageWithAnimation(RegisterRouter.page);
      default:
        return null;
    }
  }

  static PageRouteBuilder _buildPageWithAnimation(
    Widget page, [
    RouteAnimation pageAnimation = RouteAnimation.rightToLeft,
  ]) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        if (pageAnimation == RouteAnimation.fade) {
          return _fadeAnimation(context, animation, child);
        }
        if (pageAnimation == RouteAnimation.scale) {
          return _scaleAnimation(context, animation, child);
        }

        return _rightToLeftAnimation(context, animation, child);
      },
      transitionDuration: AppConstants.defaultPageAnimationDuration,
    );
  }

  static Widget _rightToLeftAnimation(context, animation, child) {
    const begin = Offset(1.0, 0.0);
    const end = Offset.zero;
    const curve = Curves.easeInOut;

    var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
    var offsetAnimation = animation.drive(tween);

    return SlideTransition(position: offsetAnimation, child: child);
  }

  static Widget _fadeAnimation(context, animation, child) {
    return FadeTransition(opacity: animation, child: child);
  }

  static Widget _scaleAnimation(context, animation, child) {
    return ScaleTransition(scale: animation, child: child);
  }
}
