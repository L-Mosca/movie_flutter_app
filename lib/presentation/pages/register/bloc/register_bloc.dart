import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_flutter_app/base/state_management/base_bloc.dart';
import 'package:movie_flutter_app/domain/models/user/register_body.dart';
import 'package:movie_flutter_app/domain/models/user/user_data.dart';
import 'package:movie_flutter_app/domain/repositories/user_repository/user_repository.dart';
import 'package:movie_flutter_app/domain/validators/register/register_validator.dart';
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
    final errorList = RegisterState.defaultErrorList;

    emitter(state.copyWith(body: newBody, errorList: errorList));
  }

  void _updateData(
    RegisterUpdateDataEvent event,
    Emitter<RegisterState> emitter,
  ) async {
    final newData = state.body?.updateData(newData: event.body);
    final errorList = registerValidator.validateRegisterFields(body: newData);
    emitter(state.copyWith(body: newData, errorList: errorList));
  }

  void _signUp(
    RegisterSignUpEvent event,
    Emitter<RegisterState> emitter,
  ) async {
    await defaultLaunch(
      function: () async {
        final body = state.body;
        final errorCode = registerValidator.validateRegisterFields(body: body);

        if (errorCode.isNotEmpty) {
          emitter(state.showErrorMessage(errorCode));
          return;
        } else {
          await userRepository.signUp(body: body!);
          await userRepository.saveUser(user: UserData.buildDefault());
          emitter(state.registerSuccess);
        }
      },
      loadingStatus: (isLoading) => emitter(state.isLoading(isLoading)),
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
