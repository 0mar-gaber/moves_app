/// id : 230
/// name : "The Godfather Collection"
/// poster_path : "/zqV8MGXfpLZiFVObLxpAI7wWonJ.jpg"
/// backdrop_path : "/mDMCET9Ens5ANvZAWRpluBsMAtS.jpg"

class BelongsToCollection {
  BelongsToCollection({
      this.id, 
      this.name, 
      this.posterPath, 
      this.backdropPath,});

  BelongsToCollection.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    posterPath = json['poster_path'];
    backdropPath = json['backdrop_path'];
  }
  int? id;
  String? name;
  String? posterPath;
  String? backdropPath;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['poster_path'] = posterPath;
    map['backdrop_path'] = backdropPath;
    return map;
  }

}