import 'package:movie_flutter_app/base/state_management/copyable.dart';
import 'package:movie_flutter_app/domain/models/movie/movie_home_response.dart';

class HomeState implements Copyable<HomeState> {
  static const firstPage = 1;
  static const pageSize = 10;

  const HomeState({
    this.list = const [],
    this.page = firstPage,
    this.lastPage = 2,
    this.filter = "",
    this.showShimmerLoading = false,
    this.showNextPageLoading = false,
    this.showEmptyPlaceHolder = false,
    this.showErrorPlaceHolder = false,
  });

  final List<MovieBasicData> list;
  final int page;
  final int lastPage;
  final String filter;
  final bool showShimmerLoading;
  final bool showNextPageLoading;
  final bool showEmptyPlaceHolder;
  final bool showErrorPlaceHolder;

  @override
  HomeState copy() {
    return HomeState(
      list: list,
      page: page,
      lastPage: lastPage,
      filter: filter,
      showShimmerLoading: showShimmerLoading,
      showNextPageLoading: showNextPageLoading,
      showEmptyPlaceHolder: showEmptyPlaceHolder,
      showErrorPlaceHolder: showErrorPlaceHolder,
    );
  }

  @override
  HomeState copyWith({
    List<MovieBasicData>? list,
    int? page,
    int? lastPage,
    String? filter,
    bool? showShimmerLoading,
    bool? showNextPageLoading,
    bool? showEmptyPlaceHolder,
    bool? showErrorPlaceHolder,
  }) {
    return HomeState(
      list: list ?? this.list,
      page: page ?? this.page,
      lastPage: lastPage ?? this.lastPage,
      filter: filter ?? this.filter,
      showShimmerLoading: showShimmerLoading ?? this.showShimmerLoading,
      showNextPageLoading: showNextPageLoading ?? this.showNextPageLoading,
      showEmptyPlaceHolder: showEmptyPlaceHolder ?? this.showEmptyPlaceHolder,
      showErrorPlaceHolder: showErrorPlaceHolder ?? this.showErrorPlaceHolder,
    );
  }

  HomeState isLoading(bool isLoading, int page) {
    if (isLoading) {
      return copyWith(
        showShimmerLoading: page == firstPage,
        showNextPageLoading: page != firstPage,
        showErrorPlaceHolder: false,
        showEmptyPlaceHolder: false,
      );
    } else {
      return copyWith(showShimmerLoading: false, showNextPageLoading: false);
    }
  }

  HomeState get showEmptyList => copyWith(
    showEmptyPlaceHolder: true,
    showShimmerLoading: false,
    showNextPageLoading: false,
    showErrorPlaceHolder: false,
  );

  HomeState get showError => copyWith(
    showEmptyPlaceHolder: false,
    showShimmerLoading: false,
    showNextPageLoading: false,
    showErrorPlaceHolder: true,
  );

  HomeState updateList(
    List<MovieBasicData> newList,
    int newPage,
    int newLastPage,
  ) => copyWith(
    list: newList,
    page: newPage,
    lastPage: newLastPage,
    showEmptyPlaceHolder: false,
    showShimmerLoading: false,
    showNextPageLoading: false,
    showErrorPlaceHolder: false,
  );
}
