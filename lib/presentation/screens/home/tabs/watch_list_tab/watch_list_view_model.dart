import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:moves_app/core/firestore/firestore_manger.dart';
import 'package:moves_app/domain/entities/movie_entity.dart';

import '../../../../../domain/use_cases/movie_details_screen_usecase/movie_details_screen_top_section_use_case.dart';
@injectable
class WatchListViewModel extends Cubit<WatchListState> {
  MovieDetailsTopSectionUseCase movieDetailsTopSectionUseCase ;
@factoryMethod
  WatchListViewModel(this.movieDetailsTopSectionUseCase):super(WatchListInitState());
  List<MoviesEntity> moviesList = [];

  getMovies(userId) async {
    emit(WatchListLoadingState());
    try{
      var result = await FireStoreManger.getMoviesList(userId);
      Set<int> uniqueElements = result.toSet();
      List<int> uniqueList = uniqueElements.toList();


      for( int x = 0 ; x<uniqueList.length;x++){
        var response = await movieDetailsTopSectionUseCase.call(uniqueList[x]);
        response.fold(
                (movie) {
                  moviesList.add(movie);
                },
                (r) => null
        );
      }
      emit(WatchListSuccessState(moviesList)) ;
    }catch(error){
      emit(WatchListErrorState(error.toString()));
    }
  }


}

abstract class WatchListState{}

class WatchListInitState extends WatchListState {}
class WatchListLoadingState extends WatchListState {}
class WatchListErrorState extends WatchListState {
  String? errorMessage ;
  WatchListErrorState(this.errorMessage);
}
class WatchListSuccessState extends WatchListState {
  List<MoviesEntity>? movies;
  WatchListSuccessState(this.movies);
}