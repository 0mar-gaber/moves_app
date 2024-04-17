import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:moves_app/domain/entities/movie_entity.dart';

import '../../../../domain/use_cases/movie_details_screen_usecase/movie_details_screen_sec_section_use_case.dart';
@injectable
class MovieDetailsSecSectionViewModel extends Cubit<MovieDetailsSecSectionState> {
  MovieDetailsSecSectionUseCase movieDetailsUseCase;
  @factoryMethod
  MovieDetailsSecSectionViewModel(this.movieDetailsUseCase):super(MovieDetailsSecSectionInitState());
  getMovieDetails(int movieId) async {
    emit(MovieDetailsSecSectionLoadingState());
    var similarMovie = await movieDetailsUseCase.call(movieId);
    similarMovie.fold(
            (similarMovie) => emit(MovieDetailsSecSectionSuccessState(similarMovie)),
            (error) => emit(MovieDetailsSecSectionErrorState(error))
    );
  }

}
abstract class MovieDetailsSecSectionState{}
class MovieDetailsSecSectionInitState extends MovieDetailsSecSectionState{}
class MovieDetailsSecSectionLoadingState extends MovieDetailsSecSectionState{}
class MovieDetailsSecSectionErrorState extends MovieDetailsSecSectionState{
  String? errorMessage ;
  MovieDetailsSecSectionErrorState(this.errorMessage);
}
class MovieDetailsSecSectionSuccessState extends MovieDetailsSecSectionState{
  List<MoviesEntity>? moviesEntity ;
  MovieDetailsSecSectionSuccessState(this.moviesEntity);
}