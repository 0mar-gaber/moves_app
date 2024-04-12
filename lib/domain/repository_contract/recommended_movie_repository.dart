import 'package:dartz/dartz.dart';
import 'package:moves_app/domain/entities/recommended_entity.dart';


abstract class RecommendedMovieRepo{
  Future<Either<List<RecommendedEntity>, String>> getRecommendedMovies();
}