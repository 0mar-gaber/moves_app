import 'package:dartz/dartz.dart';

import '../entities/movie_entity.dart';

abstract class BrowseMovieRepository{
  Future<Either<List<MoviesEntity>,String>> getFilteredMovies({required String categoryId});
}