import 'package:movie_flutter_app/base/state_management/copyable.dart';

enum SplashListener { nothing, showHome }

class SplashState implements Copyable<SplashState> {
  const SplashState({this.listener = SplashListener.nothing});

  final SplashListener listener;

  @override
  SplashState copy() {
    return SplashState(listener: listener);
  }

  @override
  SplashState copyWith({SplashListener? listener}) {
    return SplashState(listener: listener ?? this.listener);
  }

  SplashState get resetListener => copyWith(listener: SplashListener.nothing);

  SplashState get showHome => copyWith(listener: SplashListener.showHome);
}
