/// adult : false
/// backdrop_path : "/j3Z3XktmWB1VhsS8iXNcrR86PXi.jpg"
/// id : 823464
/// overview : "Following their explosive showdown, Godzilla and Kong must reunite against a colossal undiscovered threat hidden within our world, challenging their very existence – and our own."
/// poster_path : "/tMefBSflR6PGQLv7WvFPpKLZkyk.jpg"
/// release_date : "2024-03-27"
/// title : "Godzilla x Kong: The New Empire"
/// vote_average : 6.734

class NewReleasesEntity {
  NewReleasesEntity({
      this.adult, 
      this.backdropPath, 
      this.id, 
      this.overview, 
      this.posterPath, 
      this.releaseDate, 
      this.title, 
      this.voteAverage,});

  NewReleasesEntity.fromJson(dynamic json) {
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