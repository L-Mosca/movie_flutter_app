import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_flutter_app/domain/models/user/login_body.dart';
import 'package:movie_flutter_app/localization/delegate/localization_extensions.dart';
import 'package:movie_flutter_app/presentation/base_widgets/base_page.dart';
import 'package:movie_flutter_app/presentation/pages/login/bloc/login_bloc.dart';
import 'package:movie_flutter_app/presentation/pages/login/bloc/login_event.dart';
import 'package:movie_flutter_app/presentation/pages/login/bloc/login_state.dart';
import 'package:movie_flutter_app/utils/extensions/device_extensions.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BasePage<LoginBloc, LoginEvent, LoginState>(
      listener: _onChange,
      builder: _builder,
    );
  }

  void _onChange(BuildContext context, LoginState state) {
    _loginSuccess(context, state);
    _loginError(context, state);
    _showInvalidDataMessage(context, state);
  }

  Widget _builder(BuildContext context, LoginState state) {
    return Scaffold(body: SafeArea(child: Container()));
  }

  void _loginSuccess(BuildContext context, LoginState state) {
    if (state.listener == LoginListener.loginSuccess) {
      context.showShortSnackBar(message: context.strings.loginSuccess);
      Navigator.pop(context);
      context.read<LoginBloc>().add(LoginResetListenerEvent());
    }
  }

  void _loginError(BuildContext context, LoginState state) {
    if (state.listener == LoginListener.loginError) {
      context.showShortSnackBar(message: context.strings.loginError);

      context.read<LoginBloc>().add(LoginResetListenerEvent());
    }
  }

  void _showInvalidDataMessage(BuildContext context, LoginState state) {
    if (state.listener == LoginListener.invalidData) {
      final message = state.body.getErrorMessage(context, state.errorCode);
      context.showShortSnackBar(message: message);

      context.read<LoginBloc>().add(LoginResetListenerEvent());
    }
  }
}
