import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:moves_app/domain/entities/recommended_entity.dart';
import 'package:moves_app/domain/repository_contract/recommended_movie_repository.dart';
@injectable
class RecommendedUseCase{
  RecommendedMovieRepo recommendedMovieRepo ;
  @factoryMethod
  RecommendedUseCase(this.recommendedMovieRepo);
  Future<Either<List<RecommendedEntity>, String>> call(){
    return recommendedMovieRepo.getRecommendedMovies();
  }
}