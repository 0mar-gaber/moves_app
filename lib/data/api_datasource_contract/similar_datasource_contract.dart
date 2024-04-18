import 'package:dartz/dartz.dart';
import 'package:moves_app/data/models/similar_model/similar_response.dart';

abstract class SimilarDatasourceContract{
  Future<Either<SimilarResponse,String>> getSimilarMovies(int movieId);
}