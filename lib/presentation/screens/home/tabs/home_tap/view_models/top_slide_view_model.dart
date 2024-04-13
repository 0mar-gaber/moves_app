import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:moves_app/domain/use_cases/home_use_case/top_side_use_case.dart';

import '../../../../../../domain/entities/movie_entity.dart';

@injectable
class TopSlideViewModel extends Cubit<TopSlideState>{
  TopSlideUseCase topSlideUseCase ;

  @factoryMethod
  TopSlideViewModel(this.topSlideUseCase):super(TopSlideInitState());


  getTopSideMovies() async {
    emit(TopSlideLoading());

    var result = await topSlideUseCase.call();
    result.fold(
            (movies) {
              emit(TopSlideSuccess(popularMoviesList: movies));
            },
            (error) {
              emit(TopSlideError(errorMessage: error.toString()));
            }
    );
  }

}
abstract class TopSlideState{}
class TopSlideInitState extends TopSlideState{}

class TopSlideLoading extends TopSlideState{}

class TopSlideError extends TopSlideState{
  String? errorMessage ;
  TopSlideError({this.errorMessage});
}

class TopSlideSuccess extends TopSlideState{
  List<MoviesEntity>? popularMoviesList ;
  TopSlideSuccess({this.popularMoviesList});
}