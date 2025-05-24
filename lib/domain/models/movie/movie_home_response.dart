class MovieHomeResponse {
  List<MovieBasicData>? list;
  int? pageNumber;
  int? pageSize;
  int? totalPages;

  MovieHomeResponse({
    this.list,
    this.pageNumber,
    this.pageSize,
    this.totalPages,
  });

  @override
  String toString() {
    return 'MovieHomeResponse{movie_list: $list, pageNumber: $pageNumber, pageSize: $pageSize, totalPages: $totalPages}';
  }
}

class MovieBasicData {
  String? id;
  String? name;
  String? image;
  bool? isFavorite;

  MovieBasicData({this.id, this.name, this.image, this.isFavorite});

  @override
  String toString() {
    return 'MovieBasicData{id: $id, name: $name, image: $image, isFavorite: $isFavorite}';
  }
}

class MovieHomeBody {
  int pageNumber;
  int pageSize;
  String filter;

  MovieHomeBody({
    required this.pageNumber,
    required this.pageSize,
    required this.filter,
  });

  @override
  String toString() {
    return 'MovieHomeBody{pageNumber: $pageNumber, pageSize: $pageSize, filter: $filter}';
  }

  MovieHomeBody.buildBody(this.pageNumber, this.pageSize, this.filter);
}
