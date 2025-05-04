import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_flutter_app/base/state_management/base_bloc.dart';
import 'package:movie_flutter_app/domain/models/user/login_body.dart';
import 'package:movie_flutter_app/domain/models/user/user_data.dart';
import 'package:movie_flutter_app/domain/repositories/user_repository/user_repository.dart';
import 'package:movie_flutter_app/domain/validators/login/login_validator.dart';
import 'package:movie_flutter_app/presentation/pages/login/bloc/login_event.dart';
import 'package:movie_flutter_app/presentation/pages/login/bloc/login_state.dart';

class LoginBloc extends BaseBloc<LoginEvent, LoginState> {
  final UserRepository userRepository;
  final LoginValidator loginValidator;

  LoginBloc({required this.userRepository, required this.loginValidator})
    : super(const LoginState()) {
    on<LoginInitEvent>(_init);
    on<LoginUpdateDataEvent>(_updateData);
    on<LoginSignInEvent>(_signIn);
    on<LoginResetListenerEvent>(_resetListener);
  }

  void _init(LoginInitEvent event, Emitter<LoginState> emitter) async {
    final newBody = LoginBody.buildDefault();
    emitter(state.copyWith(body: newBody));
  }

  void _updateData(
    LoginUpdateDataEvent event,
    Emitter<LoginState> emitter,
  ) async {
    final newBody = state.body?.updateData(newData: event.body);
    emitter(state.copyWith(body: newBody));
  }

  void _signIn(LoginSignInEvent event, Emitter<LoginState> emitter) async {
    await defaultLaunch(
      function: () async {
        final body = state.body;
        final errorCode = loginValidator.validateLoginFields(body: body);

        if (errorCode != null) {
          emitter(state.showInvalidData(errorCode));
          return;
        } else {
          await userRepository.login(body: body!);
          await userRepository.saveUser(user: UserData.buildDefault());
          emitter(state.loginSuccess);
        }
      },
      loadingStatus: (isLoading) => emitter(state.isLoading(isLoading)),
      exceptionHandler: (exception) => emitter(state.loginError),
    );
  }

  void _resetListener(
    LoginResetListenerEvent event,
    Emitter<LoginState> emitter,
  ) async {
    emitter(state.resetListener);
  }
}
