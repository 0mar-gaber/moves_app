import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:moves_app/domain/entities/movie_entity.dart';
import 'package:moves_app/domain/repository_contract/browse_movie_repository.dart';

import '../api_datasource_contract/browse_movie_datasource_contract.dart';
@Injectable(as: BrowseMovieRepository)
class BrowseMovieRepoImpl extends BrowseMovieRepository{
  BrowseMovieDatasourceContract browseMovieDatasourceContract ;
  @factoryMethod
  BrowseMovieRepoImpl(this.browseMovieDatasourceContract);
  @override
  Future<Either<List<MoviesEntity>, String>> getFilteredMovies({required String categoryId}) async {

    var result = await browseMovieDatasourceContract.getFilteredMovies(categoryId: categoryId);
    return result.fold((response) {
      var responseList = response.results ?? [];
      var filteredMovies = responseList
          .map((movies) => MoviesEntity(
        adult: movies.adult,
        backdropPath: movies.backdropPath,
        id: movies.id,
        title: movies.title,
        posterPath: movies.posterPath,
        releaseDate: movies.releaseDate,
        overview: movies.overview,
        voteAverage:movies.voteAverage
      ))
          .toList();
      return Left(filteredMovies);
    }, (error) => Right(error));
  }

}