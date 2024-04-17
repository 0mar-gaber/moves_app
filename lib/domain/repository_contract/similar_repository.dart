import 'package:dartz/dartz.dart';
import 'package:moves_app/domain/entities/movie_entity.dart';

abstract class SimilarRepo{
  Future<Either<List<MoviesEntity>,String>> getSimilarMovies(int movieId);
}