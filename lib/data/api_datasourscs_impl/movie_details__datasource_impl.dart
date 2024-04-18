import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:moves_app/core/api/api_manger.dart';
import 'package:moves_app/core/api/end_points.dart';
import 'package:moves_app/data/models/movie_details/MovieDetailsResponse.dart';

import '../../core/constant.dart';
import '../api_datasource_contract/movie_details__datasource_contract.dart';
@Injectable(as:MovieDetailsDatasourceContract )
class MovieDetailsDatasourceImpl extends MovieDetailsDatasourceContract{
  ApiManager apiManager ;
  @factoryMethod
  MovieDetailsDatasourceImpl(this.apiManager);

  @override
  Future<Either<MovieDetailsResponse, String>> getMovieDetails(int movieId) async {
    try{
      var response = await apiManager.getRequest(endPoint: "${EndPoint.movieDetails}$movieId",queryParameters: {"api_key":Constants.apiKey});
      var movieDetailsResponse = MovieDetailsResponse.fromJson(response);
      return Left(movieDetailsResponse);
    }catch(error){
      return Right(error.toString());
    }
  }

}