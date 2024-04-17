/// adult : false
/// backdrop_path : "/1XDDXPXGiI8id7MrUxK36ke7gkX.jpg"
/// id : 1011985
/// original_language : "en"
/// original_title : "Kung Fu Panda 4"
/// overview : "Po is gearing up to become the spiritual leader of his Valley of Peace, but also needs someone to take his place as Dragon Warrior. As such, he will train a new kung fu practitioner for the spot and will encounter a villain called the Chameleon who conjures villains from the past."
/// poster_path : "/f7QBvIzoWSJw3jWPGnZBc5vwQ0l.jpg"
/// release_date : "2024-03-02"
/// title : "Kung Fu Panda 4"
  /// vote_average : 7.061

class MoviesEntity {
  MoviesEntity({
      this.adult,
      this.backdropPath,
      this.id,
      this.originalLanguage,
      this.originalTitle,
      this.overview,
      this.posterPath,
      this.releaseDate,
      this.title,
      this.voteAverage,
      this.genres});

  MoviesEntity.fromJson(dynamic json) {
    adult = json['adult'];
    backdropPath = json['backdrop_path'];
    id = json['id'];
    originalLanguage = json['original_language'];
    originalTitle = json['original_title'];
    overview = json['overview'];
    posterPath = json['poster_path'];
    releaseDate = json['release_date'];
    title = json['title'];
    voteAverage = json['vote_average'];
    genres = json["genres"];
  }
  bool? adult;
  String? backdropPath;
  int? id;
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  String? posterPath;
  String? releaseDate;
  String? title;
  double? voteAverage;
  List<dynamic>? genres;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['adult'] = adult;
    map['backdrop_path'] = backdropPath;
    map['id'] = id;
    map['original_language'] = originalLanguage;
    map['original_title'] = originalTitle;
    map['overview'] = overview;
    map['poster_path'] = posterPath;
    map['release_date'] = releaseDate;
    map['title'] = title;
    map['vote_average'] = voteAverage;
    map["genres"] = genres;
    return map;
  }

}