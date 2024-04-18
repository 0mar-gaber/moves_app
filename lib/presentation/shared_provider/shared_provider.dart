import 'package:flutter/cupertino.dart';
import 'package:moves_app/core/firestore/firestore_manger.dart';

class SharedProvider extends ChangeNotifier{

  List<int> moviesList =[];
  getAddedMoviesIds(String userId) async {
    moviesList = await FireStoreManger.getMoviesList(userId);
  }
  addToWatchList(String userId,int? movieId){
    moviesList.add(movieId!);
    FireStoreManger.addMoviesToWatchList(userId, moviesList);
    notifyListeners();
  }
  removeFromWatchList(String userId , int movieId){
    moviesList.remove(movieId);
    FireStoreManger.deleteMovieById(userId, movieId);
    notifyListeners();

  }

}