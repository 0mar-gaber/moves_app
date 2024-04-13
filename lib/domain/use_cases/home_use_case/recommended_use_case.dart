import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:moves_app/domain/repository_contract/recommended_movie_repository.dart';

import '../../entities/movie_entity.dart';
@injectable
class RecommendedUseCase{
  RecommendedMovieRepo recommendedMovieRepo ;
  @factoryMethod
  RecommendedUseCase(this.recommendedMovieRepo);
  Future<Either<List<MoviesEntity>, String>> call(){
    return recommendedMovieRepo.getRecommendedMovies();
  }
}