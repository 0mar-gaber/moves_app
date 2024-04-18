import 'package:dartz/dartz.dart';
import 'package:moves_app/data/models/recommended_model/recomended_response.dart';


abstract class RecommendedMovieDatasourceContract{
  Future<Either<RecommendedResponse, String>> getRecommendedMovies();
}