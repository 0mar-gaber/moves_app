import 'package:dartz/dartz.dart';

import '../entities/movie_entity.dart';

abstract class NewReleasesRepo{
  Future<Either<List<MoviesEntity>,String>> getNewReleasesMovies();
}