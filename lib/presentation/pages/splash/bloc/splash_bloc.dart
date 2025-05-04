import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_flutter_app/base/state_management/base_bloc.dart';
import 'package:movie_flutter_app/domain/repositories/user_repository/user_repository.dart';
import 'package:movie_flutter_app/presentation/pages/splash/bloc/splash_event.dart';
import 'package:movie_flutter_app/presentation/pages/splash/bloc/splash_state.dart';

class SplashBloc extends BaseBloc<SplashEvent, SplashState> {
  final UserRepository userRepository;

  SplashBloc({required this.userRepository}) : super(const SplashState()) {
    on<SplashInitEvent>(_init);
  }

  void _init(SplashInitEvent event, Emitter<SplashState> emitter) async {}
}
