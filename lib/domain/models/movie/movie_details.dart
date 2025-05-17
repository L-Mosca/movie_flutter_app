class MovieDetails {
  String? image;
  String? title;
  String? originalTitle;
  String? rating;
  String? duration;
  String? director;
  String? trailerLink;
  String? actors;
  String? synopsis;
  bool? isFavorite;

  MovieDetails({
    this.image,
    this.title,
    this.originalTitle,
    this.rating,
    this.duration,
    this.director,
    this.trailerLink,
    this.actors,
    this.synopsis,
    this.isFavorite,
  });

  @override
  String toString() {
    return 'MovieDetails{image: $image, title: $title, originalTitle: $originalTitle, rating: $rating, duration: $duration, director: $director, trailerLink: $trailerLink, actors: $actors, synopsis: $synopsis, isFavorite: $isFavorite}';
  }
}
