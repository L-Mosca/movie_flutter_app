import 'package:movie_flutter_app/domain/models/movie/movie_details.dart';

class MovieDetailResponseDto {
  String? id;
  String? name;
  String? originalName;
  String? date;
  int? rating;
  String? language;
  List<String>? country;
  List<String>? writers;
  List<String>? directors;
  List<String>? actors;
  String? synopsis;
  String? awards;
  String? image;
  String? type;
  String? trailer;
  String? creationDate;
  String? updatedDate;
  String? duration;
  List<String>? genre;
  int? favoriteTimes;

  MovieDetailResponseDto({
    this.id,
    this.name,
    this.originalName,
    this.date,
    this.rating,
    this.language,
    this.country,
    this.writers,
    this.directors,
    this.actors,
    this.synopsis,
    this.awards,
    this.image,
    this.type,
    this.trailer,
    this.creationDate,
    this.updatedDate,
    this.duration,
    this.genre,
    this.favoriteTimes,
  });

  @override
  String toString() {
    return 'MovieDetailResponseDto{id: $id, name: $name, originalName: $originalName, date: $date, rating: $rating, language: $language, country: $country, writers: $writers, directors: $directors, actors: $actors, synopsis: $synopsis, awards: $awards, image: $image, type: $type, trailer: $trailer, creationDate: $creationDate, updatedDate: $updatedDate, duration: $duration, genre: $genre, favoriteTimes: $favoriteTimes}';
  }

  MovieDetailResponseDto.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["nameTranslated"];
    originalName = json["originalName"];
    date = json["releaseDate"];
    rating = json["ratings"];
    language = json["language"];
    if (json["country"] != null) {
      final list = <String>[];
      json["country"].forEach((item) => list.add(item));
      country = list;
    }
    if (json["writers"] != null) {
      final list = <String>[];
      json["writers"].forEach((item) => list.add(item));
      writers = list;
    }
    if (json["directors"] != null) {
      final list = <String>[];
      json["directors"].forEach((item) => list.add(item));
      directors = list;
    }
    if (json["actors"] != null) {
      final list = <String>[];
      json["actors"].forEach((item) => list.add(item));
      actors = list;
    }
    synopsis = json["plot"];
    awards = json["awards"];
    image = json["poster"];
    type = json["type"];
    trailer = json["trailer"];
    creationDate = json["creationDate"];
    updatedDate = json["updateDate"];
    duration = json["duration"];
    if (json["genre"] != null) {
      final list = <String>[];
      json["genre"].forEach((item) => list.add(item));
      genre = list;
    }
    favoriteTimes = json["timesMarkedAsFavorite"];
  }
}

extension MovieDetailResponseDtoExtensions on MovieDetailResponseDto? {
  MovieDetails? toMovieDetails() {
    return MovieDetails(
      image: this?.image,
      title: this?.name,
      originalTitle: this?.originalName,
      rating: this?.rating.toString(),
      duration: this?.duration,
      director: this?.directors.toString(),
      trailerLink: this?.trailer,
      actors: this?.actors.toString(),
      synopsis: this?.synopsis,
      isFavorite: this?.favoriteTimes != null,
    );
  }
}
