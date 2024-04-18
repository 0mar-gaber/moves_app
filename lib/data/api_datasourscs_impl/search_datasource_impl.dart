import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:moves_app/core/api/api_manger.dart';
import 'package:moves_app/core/api/end_points.dart';
import 'package:moves_app/core/constant.dart';
import 'package:moves_app/data/models/search_model/search_response.dart';

import '../api_datasource_contract/search_datasource_contract.dart';

@Injectable(as:SearchDatasourceContract )
class SearchDatasourceImpl extends SearchDatasourceContract {
  ApiManager apiManager ;
  @factoryMethod
  SearchDatasourceImpl(this.apiManager);
  @override
  Future<Either<SearchResponse, String>> search(String query) async {
   try{
     var response = await apiManager.getRequest(endPoint: EndPoint.movieSearch , queryParameters:{"api_key":Constants.apiKey,"query":query});
     var searchResponse = SearchResponse.fromJson(response);
     return Left(searchResponse);
   }catch(error){
     return Right(error.toString());
   }
  }
}