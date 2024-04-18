import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../core/api/api_manger.dart';
import '../../core/api/end_points.dart';
import '../../core/constant.dart';
import '../api_datasource_contract/recommended_movie_datasource_contract.dart';
import '../models/recommended_model/recomended_response.dart';

@Injectable(as: RecommendedMovieDatasourceContract)
class RecommendedDatasourceImpl extends RecommendedMovieDatasourceContract{
  ApiManager apiManger ;
  @factoryMethod
  RecommendedDatasourceImpl({required this.apiManger});
  @override
  Future<Either<RecommendedResponse, String>> getRecommendedMovies() async {
    try{
      var response =await apiManger.getRequest(endPoint: EndPoint.recommendedEndPoint,queryParameters: {"api_key":Constants.apiKey});
      var recommendedResponse = RecommendedResponse.fromJson(response);
      return Left(recommendedResponse);
    }catch(error){
      return Right(error.toString());
    }
  }

}