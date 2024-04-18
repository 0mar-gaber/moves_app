import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:moves_app/core/api/api_manger.dart';
import 'package:moves_app/core/api/end_points.dart';
import 'package:moves_app/data/models/new_releases_movie_model/NewReleasesMovieResponse.dart';

import '../../core/constant.dart';
import '../api_datasource_contract/new_relealeses_datasource_contract.dart';

@Injectable(as: NewReleasesDataSourceContract)
class NewReleasesDataSourceImpl extends NewReleasesDataSourceContract {
  ApiManager apiManager;

  @factoryMethod
  NewReleasesDataSourceImpl(this.apiManager);

  @override
  Future<Either<NewReleasesMovieResponse, String>> getNewReleasesMovies() async {
    try {
      var response = await apiManager.getRequest(endPoint: EndPoint.newRelealesesEndPoint,queryParameters: {"api_key":Constants.apiKey});
      var newReleasesResponse = NewReleasesMovieResponse.fromJson(response);
      return Left(newReleasesResponse);
    } catch (error) {
      return Right(error.toString());
    }
  }
}
