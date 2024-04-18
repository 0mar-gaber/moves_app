import 'package:dartz/dartz.dart';
import '../models/browse_movie_model/browse_movie_response.dart';

abstract class BrowseMovieDatasourceContract{
  Future<Either<BrowseMovieResponseModel,String>> getFilteredMovies({required String categoryId});

}