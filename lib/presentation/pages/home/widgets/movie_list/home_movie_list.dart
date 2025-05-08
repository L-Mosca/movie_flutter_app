import 'package:flutter/material.dart';
import 'package:movie_flutter_app/base/providers/color_token_provider.dart';
import 'package:movie_flutter_app/domain/models/movie/movie_home_response.dart';
import 'package:movie_flutter_app/presentation/pages/home/widgets/movie_list/home_movie_card.dart';
import 'package:movie_flutter_app/presentation/pages/home/widgets/place_holders/home_list_empty.dart';
import 'package:movie_flutter_app/presentation/pages/home/widgets/place_holders/home_list_error.dart';

import '../../../../../utils/constants/dimensions.dart';

class HomeMovieList extends StatefulWidget {
  const HomeMovieList({
    super.key,
    required this.list,
    required this.showErrorPlaceHolder,
    required this.showEmptyPlaceHolder,
    required this.filter,
    required this.onReloadPressed,
    required this.onMoviePressed,
    required this.onFavoritePressed,
    required this.callNextPage,
  });

  final List<MovieBasicData> list;
  final bool showErrorPlaceHolder;
  final bool showEmptyPlaceHolder;
  final String filter;
  final void Function() onReloadPressed;
  final void Function(int) onMoviePressed;
  final void Function(int) onFavoritePressed;
  final void Function() callNextPage;

  @override
  State<HomeMovieList> createState() => _HomeMovieListState();
}

class _HomeMovieListState extends State<HomeMovieList> {
  final _controller = ScrollController();

  @override
  void initState() {
    super.initState();
    _controller.addListener(_onScroll);
  }

  @override
  void dispose() {
    _controller.removeListener(_onScroll);
    _controller.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_controller.position.atEdge) {
      bool isBottom = _controller.position.pixels == _controller.position.maxScrollExtent;
      if (isBottom) widget.callNextPage();
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.showEmptyPlaceHolder) return HomeListEmpty(filter: widget.filter);
    if (widget.showEmptyPlaceHolder) return HomeListError(onPressed: widget.onReloadPressed);

    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: Dimensions.marginSmall),
        color: context.colors.primary,
        child: GridView.builder(
          controller: _controller,
          shrinkWrap: true,
          gridDelegate: _gridDelegate,
          itemCount: widget.list.length,
          padding: const EdgeInsets.all(Dimensions.marginSmall),
          itemBuilder: (context, index) {
            final data = widget.list[index];
            return HomeMovieCard(
              movie: data,
              onFavoritePressed: () => widget.onFavoritePressed(data.id ?? -1),
              onMoviePressed: () => widget.onMoviePressed(data.id ?? -1),
            );
          },
        ),
      ),
    );
  }

  SliverGridDelegate get _gridDelegate =>
      const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 20.0,
        mainAxisSpacing: 20.0,
        mainAxisExtent: 330.0,
      );
}
