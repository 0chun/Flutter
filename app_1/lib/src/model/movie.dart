class Movie {
  String overView;
  String posterPath;
  String title;

  Movie({required this.overView, required this.posterPath, required this.title});

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      overView: json["overview"] as String,
      posterPath: json["poster_path"] as String,
      title: json["title"] as String,
    );
  } 

  String get posterUrl => 'http://image.tmdb.org/t/p/w500/${this.posterPath}';
}
