import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:moves_app/domain/use_cases/home_use_case/recommended_use_case.dart';

import '../../../../../../domain/entities/movie_entity.dart';

@injectable
class RecommendedViewModel extends Cubit<RecommendedState>{
  RecommendedUseCase recommendedUseCase ;
  @factoryMethod
  RecommendedViewModel(this.recommendedUseCase):super(RecommendedInitState());
  getRecommendedMovies() async {
    emit(RecommendedLoading());
    var result = await recommendedUseCase.call();
    result.fold(
            (movies) => emit(RecommendedSuccess(movies)),
            (error) => emit(RecommendedError(error))
    );
  }

}
abstract class RecommendedState{}
class RecommendedInitState extends RecommendedState{}

class RecommendedLoading extends RecommendedState{}

class RecommendedSuccess extends RecommendedState{
  List<MoviesEntity>? moviesList ;
  RecommendedSuccess(this.moviesList);
}

class RecommendedError extends RecommendedState{
  String? errorMessage;
  RecommendedError(this.errorMessage);
}