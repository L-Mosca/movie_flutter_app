import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_flutter_app/base/state_management/base_bloc.dart';
import 'package:movie_flutter_app/presentation/pages/splash/bloc/splash_event.dart';
import 'package:movie_flutter_app/presentation/pages/splash/bloc/splash_state.dart';

class SplashBloc extends BaseBloc<SplashEvent, SplashState> {

  SplashBloc() : super(const SplashState()) {
    on<SplashInitEvent>(_init);
    on<SplashResetListenerEvent>(_resetListener);
  }

  void _init(SplashInitEvent event, Emitter<SplashState> emitter) async {
    await defaultLaunch(
      function: () async {
        await Future.delayed(const Duration(seconds: 2));
        emitter(state.showHome);
      },
    );
  }

  void _resetListener(
    SplashResetListenerEvent event,
    Emitter<SplashState> emitter,
  ) async {
    emitter(state.resetListener);
  }
}
