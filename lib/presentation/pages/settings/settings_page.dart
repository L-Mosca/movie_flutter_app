import 'package:flutter/material.dart';
import 'package:movie_flutter_app/presentation/base_widgets/base_page.dart';
import 'package:movie_flutter_app/presentation/pages/settings/bloc/settings_bloc.dart';
import 'package:movie_flutter_app/presentation/pages/settings/bloc/settings_event.dart';
import 'package:movie_flutter_app/presentation/pages/settings/bloc/settings_state.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BasePage<SettingsBloc, SettingsEvent, SettingsState>(
      listener: _onChange,
      builder: _builder,
    );
  }

  void _onChange(BuildContext context, SettingsState state) {}

  Widget _builder(BuildContext context, SettingsState state) {
    return Scaffold(body: SafeArea(child: Container()));
  }
}
