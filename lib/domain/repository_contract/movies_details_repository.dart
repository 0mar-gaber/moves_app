import 'package:dartz/dartz.dart';
import 'package:moves_app/domain/entities/movie_entity.dart';

abstract class MovieDetailsRepo{
  Future<Either<MoviesEntity,String>>getMovieDetails(int movieId);
}