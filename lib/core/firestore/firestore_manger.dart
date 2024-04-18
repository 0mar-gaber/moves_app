import 'package:cloud_firestore/cloud_firestore.dart';

class FireStoreManger {
  static Future<void> addMoviesToWatchList(String userId, List<int> moviesList) async {
    var db = FirebaseFirestore.instance;
    await db.collection("users").doc(userId).set({"movies_list": moviesList});
  }

  static Future<List<int>> getMoviesList(String userId) async {
    var db = FirebaseFirestore.instance;

    var documentSnapshot = await db.collection("users").doc(userId).get();

    if (documentSnapshot.exists) {
      var data = documentSnapshot.data();

      if (data!.containsKey("movies_list") && data["movies_list"] is List) {
        List<int> moviesList = List<int>.from(data["movies_list"]);

        return moviesList;
      } else {
        return [];
      }
    } else {
      return [];
    }
  }

  static Future<void> deleteMovieById(String userId, int movieId) async {
    var db = FirebaseFirestore.instance;

    List<int> moviesList = await getMoviesList(userId);

    int index = moviesList.indexOf(movieId);

    if (index != -1) {
      moviesList.removeAt(index);

      await db.collection("users").doc(userId).update({"movies_list": moviesList});
    } else {
      print("Movie with ID $movieId not found in the list.");
    }
  }
}
