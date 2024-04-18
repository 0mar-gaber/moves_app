import 'package:dartz/dartz.dart';
import 'package:moves_app/data/models/movie_details/MovieDetailsResponse.dart';

abstract class MovieDetailsDatasourceContract{
  Future<Either<MovieDetailsResponse,String>>getMovieDetails(int movieId);
}