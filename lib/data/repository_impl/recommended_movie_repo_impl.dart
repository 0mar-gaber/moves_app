import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:moves_app/data/datasource_contract/recommended_movie_datasource_contract.dart';

import 'package:moves_app/domain/entities/recommended_entity.dart';

import '../../domain/repository_contract/recommended_movie_repository.dart';

@Injectable(as:RecommendedMovieRepo )
class RecommendedMovieRepoImpl extends RecommendedMovieRepo {
  RecommendedMovieDatasourceContract recommendedMovieDatasourceContract ;
  @factoryMethod
  RecommendedMovieRepoImpl(this.recommendedMovieDatasourceContract);
  @override
  Future<Either<List<RecommendedEntity>, String>> getRecommendedMovies() async {
    var result = await recommendedMovieDatasourceContract.getRecommendedMovies();
    return result.fold(
            (response){
              var responseList = response.results??[];
              var recommendedList = responseList.map((newReleaseMovie) => RecommendedEntity(
                title: newReleaseMovie.title,
                overview: newReleaseMovie.overview,
                adult: newReleaseMovie.adult,
                releaseDate: newReleaseMovie.releaseDate,
                posterPath: newReleaseMovie.posterPath,
                backdropPath: newReleaseMovie.backdropPath,
                id: newReleaseMovie.id,
                voteAverage: newReleaseMovie.voteAverage,
              )).toList();
              return Left(recommendedList);

            },
            (error) => Right(error)
    );
  }

}