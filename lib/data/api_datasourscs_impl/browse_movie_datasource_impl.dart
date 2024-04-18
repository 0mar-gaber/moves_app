import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:moves_app/core/api/api_manger.dart';
import 'package:moves_app/data/models/browse_movie_model/browse_movie_response.dart';
import '../../core/api/end_points.dart';
import '../../core/constant.dart';
import '../api_datasource_contract/browse_movie_datasource_contract.dart';

@Injectable(as: BrowseMovieDatasourceContract)
class BrowseMovieDatasourceImpl extends BrowseMovieDatasourceContract {
  ApiManager apiManager ;
  @factoryMethod
  BrowseMovieDatasourceImpl(this.apiManager);

  @override
  Future<Either<BrowseMovieResponseModel, String>> getFilteredMovies({required String categoryId}) async {
      try{
        var response = await apiManager.getRequest(endPoint: EndPoint.browseEndPoint,queryParameters: {"api_key":Constants.apiKey,"with_genres":categoryId});
        var browseMovieResponseModel = BrowseMovieResponseModel.fromJson(response);

        return Left(browseMovieResponseModel);
      }catch(error){
        return Right(error.toString());
      }

    }

  }
