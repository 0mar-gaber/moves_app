import 'package:dartz/dartz.dart';

import '../entities/movie_entity.dart';


abstract class PopularMovieRepo {
  Future<Either<List<MoviesEntity>, String>> getPopularMovie();
}
