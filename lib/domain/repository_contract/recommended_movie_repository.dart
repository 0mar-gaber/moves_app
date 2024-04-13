import 'package:dartz/dartz.dart';
import '../entities/movie_entity.dart';


abstract class RecommendedMovieRepo{
  Future<Either<List<MoviesEntity>, String>> getRecommendedMovies();
}