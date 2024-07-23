// class Movie {
//   final bool adult;
//   final String backdropPath;
//   final List<int> genreIds;
//   final int id;
//   final String originalLanguage;
//   final String originalTitle;
//   final String overview;
//   final double popularity;
//   final String posterPath;
//   final String releaseDate;
//   final String title;
//   final bool video;
//   final double voteAverage;
//   final int voteCount;

//   Movie({
//     required this.adult,
//     required this.backdropPath,
//     required this.genreIds,
//     required this.id,
//     required this.originalLanguage,
//     required this.originalTitle,
//     required this.overview,
//     required this.popularity,
//     required this.posterPath,
//     required this.releaseDate,
//     required this.title,
//     required this.video,
//     required this.voteAverage,
//     required this.voteCount,
//   });

//   factory Movie.fromJson(Map<String, dynamic> json) {
//     return Movie(
//       adult: json['adult'],
//       backdropPath: json['backdrop_path'],
//       genreIds: List<int>.from(json['genre_ids']),
//       id: json['id'],
//       originalLanguage: json['original_language'],
//       originalTitle: json['original_title'],
//       overview: json['overview'],
//       popularity: json['popularity'].toDouble(),
//       posterPath: json['poster_path'],
//       releaseDate: json['release_date'],
//       title: json['title'],
//       video: json['video'],
//       voteAverage: json['vote_average'].toDouble(),
//       voteCount: json['vote_count'],
//     );
//   }
// }



class Movie {
  final String posterPath;
  final String backdropPath;
  final String title;
  final double voteAverage;
  final double popularity;
  final String overview;

  Movie({
    required this.posterPath,
    required this.backdropPath,
    required this.title,
    required this.voteAverage,
    required this.popularity,
    required this.overview,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      posterPath: json['poster_path'] ?? '',
      backdropPath: json['backdrop_path'] ?? '',
      title: json['title'] ?? 'No Title',
      voteAverage: json['vote_average']?.toDouble() ?? 0.0,
      popularity: json['popularity']?.toDouble() ?? 0.0,
      overview: json['overview'] ?? 'No Overview',
    );
  }
}