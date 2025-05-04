import 'package:flutter/material.dart';
import 'package:movie_flutter_app/presentation/base_widgets/base_page.dart';
import 'package:movie_flutter_app/presentation/pages/home/bloc/home_bloc.dart';
import 'package:movie_flutter_app/presentation/pages/home/bloc/home_event.dart';
import 'package:movie_flutter_app/presentation/pages/home/bloc/home_state.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BasePage<HomeBloc, HomeEvent, HomeState>(
      listener: _onChange,
      builder: _builder,
    );
  }

  void _onChange(BuildContext context, HomeState state) {}

  Widget _builder(BuildContext context, HomeState state) {
    return Container();
  }
}
