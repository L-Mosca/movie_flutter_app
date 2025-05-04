import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_flutter_app/base/state_management/base_bloc.dart';
import 'package:movie_flutter_app/domain/models/user/register_body.dart';
import 'package:movie_flutter_app/domain/repositories/user_repository/user_repository.dart';
import 'package:movie_flutter_app/domain/validators/register_validator.dart';
import 'package:movie_flutter_app/presentation/pages/register/bloc/register_event.dart';
import 'package:movie_flutter_app/presentation/pages/register/bloc/register_state.dart';

class RegisterBloc extends BaseBloc<RegisterEvent, RegisterState> {
  final UserRepository userRepository;
  final RegisterValidator registerValidator;

  RegisterBloc({required this.userRepository, required this.registerValidator})
    : super(const RegisterState()) {
    on<RegisterInitEvent>(_init);
    on<RegisterUpdateDataEvent>(_updateData);
    on<RegisterSignUpEvent>(_signUp);
    on<RegisterChangePasswordVisibilityEvent>(_changePasswordVisibility);
    on<RegisterResetListener>(_resetListener);
  }

  void _init(RegisterInitEvent event, Emitter<RegisterState> emitter) async {
    final newBody = RegisterBody.buildDefault();

    emitter(state.copyWith(body: newBody));
  }

  void _updateData(
    RegisterUpdateDataEvent event,
    Emitter<RegisterState> emitter,
  ) async {
    final newData = state.body?.updateData(newData: event.body);
    emitter(state.copyWith(body: newData));
  }

  void _signUp(
    RegisterSignUpEvent event,
    Emitter<RegisterState> emitter,
  ) async {
    await defaultLaunch(
      function: () async {
        final body = state.body;
        final errorCode = registerValidator.validateRegisterFields(body: body);

        if (errorCode != null) {
          print("ERRO RETORNADO: $errorCode");
          return;
        } else {
          print("SUCESSO");
          await userRepository.signUp(body: body!);
        }
      },
      loadingStatus: (isLoading) {
        print("ESTA CARREGANDO: $isLoading");
        emitter(state.isLoading(isLoading));
      },
      exceptionHandler: (exception) => emitter(state.registerError),
    );
  }

  void _changePasswordVisibility(
    RegisterChangePasswordVisibilityEvent event,
    Emitter<RegisterState> emitter,
  ) async {
    emitter(state.copyWith(obscureText: !state.obscureText));
  }

  void _resetListener(
    RegisterResetListener event,
    Emitter<RegisterState> emitter,
  ) async {
    emitter(state.resetListener);
  }
}
