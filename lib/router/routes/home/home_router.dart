import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_flutter_app/presentation/pages/home/bloc/home_bloc.dart';
import 'package:movie_flutter_app/presentation/pages/home/bloc/home_event.dart';
import 'package:movie_flutter_app/presentation/pages/home/home_page.dart';

class HomeRouter {
  const HomeRouter();

  static Widget get page => BlocProvider(
    create: (_) => HomeBloc()..add(HomeInitEvent()),
    child: const HomePage(),
  );
}
