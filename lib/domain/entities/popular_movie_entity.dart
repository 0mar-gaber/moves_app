/// adult : false
/// backdrop_path : "/xOMo8BRK7PfcJv9JCnx7s5hj0PX.jpg"
/// id : 693134
/// overview : "Follow the mythic journey of Paul Atreides as he unites with Chani and the Fremen while on a path of revenge against the conspirators who destroyed his family. Facing a choice between the love of his life and the fate of the known universe, Paul endeavors to prevent a terrible future only he can foresee."
/// poster_path : "/1pdfLvkbY9ohJlCjQH2CZjjYVvJ.jpg"
/// release_date : "2024-02-27"
/// title : "Dune: Part Two"
/// vote_average : 8.323

class PopularMovieEntity {
  PopularMovieEntity({
      this.adult, 
      this.backdropPath, 
      this.id, 
      this.overview, 
      this.posterPath, 
      this.releaseDate, 
      this.title, 
      this.voteAverage,});

  PopularMovieEntity.fromJson(dynamic json) {
    adult = json['adult'];
    backdropPath = json['backdrop_path'];
    id = json['id'];
    overview = json['overview'];
    posterPath = json['poster_path'];
    releaseDate = json['release_date'];
    title = json['title'];
    voteAverage = json['vote_average'];
  }
  bool? adult;
  String? backdropPath;
  int? id;
  String? overview;
  String? posterPath;
  String? releaseDate;
  String? title;
  double? voteAverage;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['adult'] = adult;
    map['backdrop_path'] = backdropPath;
    map['id'] = id;
    map['overview'] = overview;
    map['poster_path'] = posterPath;
    map['release_date'] = releaseDate;
    map['title'] = title;
    map['vote_average'] = voteAverage;
    return map;
  }

}