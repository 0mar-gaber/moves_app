import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:moves_app/core/api/api_manger.dart';
import 'package:moves_app/core/api/end_points.dart';
import 'package:moves_app/core/constant.dart';

import '../api_datasource_contract/popular_movie_datasource_contract.dart';
import '../models/popular_movies_model/popular_movie_response.dart';

@Injectable(as: PopularMovieDatasourceContract)
class PopularMovieDatasourceImpl extends PopularMovieDatasourceContract{
  ApiManager apiManger ;
  @factoryMethod
  PopularMovieDatasourceImpl({required this.apiManger});
  @override
   Future<Either<PopularMovieResponse,String>> getPopularMovies() async {
    try{
      var response =await apiManger.getRequest(endPoint: EndPoint.popularEndPoint,queryParameters: {"api_key":Constants.apiKey});
      var popularResponse = PopularMovieResponse.fromJson(response);
      return Left(popularResponse);
    }catch(error){
      return Right(error.toString());
    }

  }

}