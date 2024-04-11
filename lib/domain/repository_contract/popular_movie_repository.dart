import 'package:dartz/dartz.dart';

import '../entities/popular_movie_entity.dart';

abstract class PopularMovieRepo {
  Future<Either<List<PopularMovieEntity>, String>> getPopularMovie();
}
