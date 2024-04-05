class Movie {
  int id;
  String title;
  double voteAverage;
  String overview;
  String? posterPath;

  Movie(this.id, this.title, this.voteAverage, this.overview, this.posterPath);

  factory Movie.fromJson(Map<String, dynamic> parsedJson) {
    return Movie(
      parsedJson['id'],
      parsedJson['title'],
      parsedJson['voteaverage'] * 1.0,
      parsedJson['overview'],
      parsedJson['posterpath'],
    );
  }
}
