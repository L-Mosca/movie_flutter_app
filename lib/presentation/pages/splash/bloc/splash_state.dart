import 'package:movie_flutter_app/base/state_management/copyable.dart';

class SplashState implements Copyable<SplashState> {
  const SplashState();

  @override
  SplashState copy() {
    return SplashState();
  }

  @override
  SplashState copyWith() {
    return SplashState();
  }
}
