import 'package:movie_flutter_app/domain/models/movie/movie_home_response.dart';
import 'package:movie_flutter_app/utils/constants/app_constants.dart';

class MovieListResponseDto {
  List<MovieBasicDataDto>? movies;
  ListPageData? pageData;

  MovieListResponseDto({this.movies, this.pageData});

  @override
  String toString() {
    return 'MovieListResponseDto{movies: $movies, pageData: $pageData}';
  }

  MovieListResponseDto.fromJson(Map<String, dynamic> json) {
    if (json["items"] != null) {
      final list = <MovieBasicDataDto>[];
      json["items"].forEach(
        (item) => list.add(MovieBasicDataDto.fromJson(item)),
      );
      movies = list;
    }
    pageData = ListPageData.fromJson(json["meta"]);
  }
}

class MovieBasicDataDto {
  String? id;
  String? name;
  String? date;
  int? rating;
  String? image;

  MovieBasicDataDto({this.id, this.name, this.date, this.rating, this.image});

  @override
  String toString() {
    return 'MovieBasicDataDto{id: $id, name: $name, date: $date, rating: $rating, image: $image}';
  }

  MovieBasicDataDto.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["nameTranslated"];
    date = json["releaseDate"];
    rating = json["ratings"];
    image = json["poster"];
  }
}

class ListPageData {
  int? totalItems;
  int? itemCount;
  int? pageSize;
  int? lastPage;
  int? page;

  ListPageData({
    this.totalItems,
    this.itemCount,
    this.pageSize,
    this.lastPage,
    this.page,
  });

  @override
  String toString() {
    return 'ListPageData{totalItems: $totalItems, itemCount: $itemCount, pageSize: $pageSize, lastPage: $lastPage, page: $page}';
  }

  ListPageData.fromJson(Map<String, dynamic> json) {
    totalItems = json["totalItems"];
    itemCount = json["itemCount"];
    pageSize = json["itemsPerPage"];
    lastPage = json["totalPages"];
    page = json["currentPage"];
  }
}

extension MovieListResponseDtoExtensions on MovieListResponseDto? {
  MovieHomeResponse? toMovieHomeResponse() {
    final list = <MovieBasicData>[];
    this?.movies?.forEach((movie) => list.add(movie.toMovieBasicData()));
    return MovieHomeResponse(
      list: list,
      pageNumber: this?.pageData?.page ?? 1,
      pageSize: this?.pageData?.pageSize ?? AppConstants.moviePageSize,
      totalPages: this?.pageData?.lastPage ?? 1,
    );
  }
}

extension MovieBasicDataDtoExtensions on MovieBasicDataDto? {
  MovieBasicData toMovieBasicData() {
    return MovieBasicData(
      id: this?.id,
      name: this?.name ?? "",
      image: this?.image ?? "",
      isFavorite: false,
    );
  }
}
