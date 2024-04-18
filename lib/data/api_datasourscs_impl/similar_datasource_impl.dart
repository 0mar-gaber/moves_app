import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:moves_app/core/api/api_manger.dart';
import 'package:moves_app/data/models/similar_model/similar_response.dart';

import '../../core/constant.dart';
import '../api_datasource_contract/similar_datasource_contract.dart';
@Injectable(as: SimilarDatasourceContract)
class SimilarDataSourceImpl extends SimilarDatasourceContract{
  ApiManager apiManager ;
  @factoryMethod
  SimilarDataSourceImpl(this.apiManager);
  @override
  Future<Either<SimilarResponse,String>> getSimilarMovies(int movieId) async {
    try{
      var response = await apiManager.getRequest(endPoint: "/3/movie/$movieId/similar",queryParameters: {"api_key":Constants.apiKey});
      var similarResponse = SimilarResponse.fromJson(response);
      return Left(similarResponse);
    }catch(error){
      return Right(error.toString());
    }
  }
  
}
