import 'package:movie_flutter_app/base/state_management/copyable.dart';

class HomeState implements Copyable<HomeState> {
  const HomeState();

  @override
  HomeState copy() {
    return HomeState();
  }

  @override
  HomeState copyWith() {
    return HomeState();
  }
}
