import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_flutter_app/domain/models/user/register_body.dart';
import 'package:movie_flutter_app/localization/delegate/localization_extensions.dart';
import 'package:movie_flutter_app/presentation/base_widgets/base_page.dart';
import 'package:movie_flutter_app/presentation/pages/register/bloc/register_bloc.dart';
import 'package:movie_flutter_app/presentation/pages/register/bloc/register_event.dart';
import 'package:movie_flutter_app/presentation/pages/register/bloc/register_state.dart';
import 'package:movie_flutter_app/presentation/pages/register/widgets/register_button.dart';
import 'package:movie_flutter_app/presentation/pages/register/widgets/register_has_account_text.dart';
import 'package:movie_flutter_app/presentation/pages/register/widgets/text_fields/register_fields.dart';
import 'package:movie_flutter_app/presentation/pages/register/widgets/top_header/register_icon.dart';
import 'package:movie_flutter_app/presentation/pages/register/widgets/top_header/register_subtitle.dart';
import 'package:movie_flutter_app/presentation/pages/register/widgets/top_header/register_title.dart';
import 'package:movie_flutter_app/router/app_router.dart';
import 'package:movie_flutter_app/utils/constants/dimensions.dart';
import 'package:movie_flutter_app/utils/device_utils/device_utils.dart';
import 'package:movie_flutter_app/utils/extensions/device_extensions.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BasePage<RegisterBloc, RegisterEvent, RegisterState>(
      listener: _onChange,
      builder: _builder,
    );
  }

  void _onChange(BuildContext context, RegisterState state) {
    _showInvalidDataMessage(context, state);
    _showRegisterErrorMessage(context, state);
    _registerSuccess(context, state);
  }

  Widget _builder(BuildContext context, RegisterState state) {
    return Scaffold(
      body: SafeArea(
        child: GestureDetector(
          onTap: () => DeviceUtils.hideKeyboard(context),
          child: Container(
            margin: _margin,
            width: double.infinity,
            child: Column(
              children: [
                _expandedScrollView(
                  children: [
                    RegisterIcon(),
                    RegisterTitle(),
                    RegisterSubtitle(),
                    RegisterFields(
                      updateData: (data) => _updateFieldsData(context, data),
                      onChangeVisibilityPressed:
                          () => _updateVisibility(context),
                      onSubmitted: () => _onSignUpPressed(context),
                      body: state.body,
                      obscureText: state.obscureText,
                    ),
                  ],
                ),
                RegisterButton(
                  onPressed: () => _onSignUpPressed(context),
                  showLoading: state.showLoading,
                ),
                if (!state.showLoading)
                  RegisterHasAccountText(
                    onClickHerePressed: () => _showLoginPage(context),
                  ),
                const SizedBox(height: Dimensions.marginMedium),
              ],
            ),
          ),
        ),
      ),
    );
  }

  EdgeInsets get _margin =>
      const EdgeInsets.symmetric(horizontal: Dimensions.marginMedium);

  Widget _expandedScrollView({required List<Widget> children}) {
    return Expanded(
      child: SingleChildScrollView(child: Column(children: children)),
    );
  }

  void _updateFieldsData(BuildContext context, RegisterBody body) {
    context.read<RegisterBloc>().add(RegisterUpdateDataEvent(body: body));
  }

  void _updateVisibility(BuildContext context) {
    context.read<RegisterBloc>().add(RegisterChangePasswordVisibilityEvent());
  }

  void _onSignUpPressed(BuildContext context) {
    DeviceUtils.hideKeyboard(context);
    context.read<RegisterBloc>().add(RegisterSignUpEvent());
  }

  void _showLoginPage(BuildContext context) {
    DeviceUtils.hideKeyboard(context);
    Navigator.pushNamed(context, AppRouter.loginRoute);
  }

  void _showInvalidDataMessage(BuildContext context, RegisterState state) {
    if (state.listener == RegisterListener.invalidData) {
      final message = state.body.getErrorMessage(context, state.errorCode);
      context.showShortSnackBar(message: message);

      context.read<RegisterBloc>().add(RegisterResetListener());
    }
  }

  void _showRegisterErrorMessage(BuildContext context, RegisterState state) {
    if (state.listener == RegisterListener.registerError) {
      context.showShortSnackBar(message: context.strings.registerError);

      context.read<RegisterBloc>().add(RegisterResetListener());
    }
  }

  void _registerSuccess(BuildContext context, RegisterState state) {
    if (state.listener == RegisterListener.registerSuccess) {
      context.showShortSnackBar(message: context.strings.registerError);
      Navigator.pop(context);
      context.read<RegisterBloc>().add(RegisterResetListener());
    }
  }
}
