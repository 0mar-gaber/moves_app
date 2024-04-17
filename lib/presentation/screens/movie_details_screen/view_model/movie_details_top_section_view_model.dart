import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:moves_app/domain/entities/movie_entity.dart';

import '../../../../domain/use_cases/movie_details_screen_usecase/movie_details_screen_top_section_use_case.dart';
@injectable
class MovieDetailsTopSectionViewModel extends Cubit<MovieTopSectionDetailsState> {
  MovieDetailsTopSectionUseCase movieDetailsUseCase;
  @factoryMethod
  MovieDetailsTopSectionViewModel(this.movieDetailsUseCase):super(MovieDetailsTopSectionInitState());
  getMovieDetails(int movieId) async {
    emit(MovieDetailsTopSectionLoadingState());
    var movieDetailsResult = await movieDetailsUseCase.call(movieId) ;
    movieDetailsResult.fold(
            (movieDetails) => emit(MovieDetailsTopSectionSuccessState(movieDetails)),
            (error) => emit(MovieDetailsTopSectionErrorState(error))
    );
  }

}
abstract class MovieTopSectionDetailsState{}
class MovieDetailsTopSectionInitState extends MovieTopSectionDetailsState{}
class MovieDetailsTopSectionLoadingState extends MovieTopSectionDetailsState{}
class MovieDetailsTopSectionErrorState extends MovieTopSectionDetailsState{
  String? errorMessage ;
  MovieDetailsTopSectionErrorState(this.errorMessage);
}
class MovieDetailsTopSectionSuccessState extends MovieTopSectionDetailsState{
  MoviesEntity? moviesEntity ;
  MovieDetailsTopSectionSuccessState(this.moviesEntity);
}