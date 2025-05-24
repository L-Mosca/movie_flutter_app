abstract class HomeEvent {}

class HomeInitEvent extends HomeEvent {}

class HomeReloadEvent extends HomeEvent {}

class HomeNextPageEvent extends HomeEvent {}

class HomeFilterEvent extends HomeEvent {}

class HomeUpdateFilterEvent extends HomeEvent {
  final String filter;

  HomeUpdateFilterEvent({required this.filter});
}

class HomeFavoriteEvent extends HomeEvent {
  final String id;

  HomeFavoriteEvent({required this.id});
}

class HomeResetListener extends HomeEvent {}
