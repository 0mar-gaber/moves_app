import 'package:dartz/dartz.dart';

import '../models/popular_movies_model/popular_movie_response.dart';

abstract class PopularMovieDatasourceContract{
  Future<Either<PopularMovieResponse,String>> getPopularMovies();
}