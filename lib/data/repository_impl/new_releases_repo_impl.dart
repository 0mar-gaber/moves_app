import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:moves_app/domain/entities/movie_entity.dart';
import 'package:moves_app/domain/repository_contract/new_releases_repository.dart';

import '../api_datasource_contract/new_relealeses_datasource_contract.dart';

@Injectable(as: NewReleasesRepo)
class NewReleasesRepoImpl extends NewReleasesRepo {
  NewReleasesDataSourceContract newReleasesDataSourceContract;

  @factoryMethod
  NewReleasesRepoImpl(this.newReleasesDataSourceContract);

  @override
  Future<Either<List<MoviesEntity>, String>> getNewReleasesMovies() async {
    var result = await newReleasesDataSourceContract.getNewReleasesMovies();
    return result.fold((response) {
      var responseList = response.results ?? [];
      var newReleasesMovieList = responseList
          .map((newReleasesMovie) => MoviesEntity(
                adult: newReleasesMovie.adult,
                backdropPath: newReleasesMovie.backdropPath,
                id: newReleasesMovie.id,
                title: newReleasesMovie.title,
                posterPath: newReleasesMovie.posterPath,
                releaseDate: newReleasesMovie.releaseDate,
                overview: newReleasesMovie.overview,
              ))
          .toList();
      return Left(newReleasesMovieList);
    }, (error) => Right(error));
  }
}
