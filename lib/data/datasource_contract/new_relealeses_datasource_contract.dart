import 'package:dartz/dartz.dart';
import 'package:moves_app/data/models/new_releases_movie_model/NewReleasesMovieResponse.dart';


abstract class NewReleasesDataSourceContract{
  Future<Either<NewReleasesMovieResponse,String>> getNewReleasesMovies();
}