import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_flutter_app/domain/models/user/login_body.dart';
import 'package:movie_flutter_app/localization/delegate/localization_extensions.dart';
import 'package:movie_flutter_app/presentation/base_widgets/base_page.dart';
import 'package:movie_flutter_app/presentation/pages/login/bloc/login_bloc.dart';
import 'package:movie_flutter_app/presentation/pages/login/bloc/login_event.dart';
import 'package:movie_flutter_app/presentation/pages/login/bloc/login_state.dart';
import 'package:movie_flutter_app/presentation/pages/login/widgets/bottom_header/login_bottom_line.dart';
import 'package:movie_flutter_app/presentation/pages/login/widgets/bottom_header/login_bottom_message.dart';
import 'package:movie_flutter_app/presentation/pages/login/widgets/fields/login_fields.dart';
import 'package:movie_flutter_app/presentation/pages/login/widgets/login_button.dart';
import 'package:movie_flutter_app/presentation/pages/login/widgets/top_header/login_icon.dart';
import 'package:movie_flutter_app/presentation/pages/login/widgets/top_header/login_subtitle.dart';
import 'package:movie_flutter_app/presentation/pages/login/widgets/top_header/login_title.dart';
import 'package:movie_flutter_app/router/app_router.dart';
import 'package:movie_flutter_app/utils/constants/dimensions.dart';
import 'package:movie_flutter_app/utils/device_utils/device_utils.dart';
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
    return Scaffold(
      body: SafeArea(
        child: GestureDetector(
          onTap: () => DeviceUtils.hideKeyboard(context),
          child: Container(
            width: double.infinity,
            margin: _margin,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                LoginIcon(),
                LoginTitle(),
                LoginSubtitle(),
                LoginFields(
                  onUpdateData: (data) => _updateData(context, data),
                  onSubmitted: () => _onSignInPressed(context),
                  body: state.body,
                ),
                LoginButton(
                  onPressed: () => _onSignInPressed(context),
                  showLoading: state.showLoading,
                ),
                if (!state.showLoading) ...[
                  LoginBottomLine(),
                  LoginBottomMessage(
                    onClickHerePressed: () => _goToRegisterPage(context),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }

  EdgeInsets get _margin =>
      const EdgeInsets.symmetric(horizontal: Dimensions.marginMedium);

  void _updateData(BuildContext context, LoginBody body) {
    context.read<LoginBloc>().add(LoginUpdateDataEvent(body: body));
  }

  void _onSignInPressed(BuildContext context) {
    DeviceUtils.hideKeyboard(context);
    context.read<LoginBloc>().add(LoginSignInEvent());
  }

  void _goToRegisterPage(BuildContext context) {
    Navigator.pushNamed(context, AppRouter.registerRoute);
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
