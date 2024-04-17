import 'package:dartz/dartz.dart';
import 'package:moves_app/data/models/search_model/search_response.dart';

abstract class SearchDatasourceContract{
  Future<Either<SearchResponse,String>> search(String query);
}