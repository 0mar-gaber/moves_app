import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:moves_app/domain/entities/movie_entity.dart';
import 'package:moves_app/domain/repository_contract/movies_details_repository.dart';

import '../api_datasource_contract/movie_details__datasource_contract.dart';
@Injectable(as: MovieDetailsRepo)
class MovieDetailsRepoImpl extends MovieDetailsRepo{
  MovieDetailsDatasourceContract movieDetailsDatasourceContract ;
  @factoryMethod
  MovieDetailsRepoImpl(this.movieDetailsDatasourceContract);
  @override
  Future<Either<MoviesEntity, String>> getMovieDetails(int movieId) async {
    var result = await movieDetailsDatasourceContract.getMovieDetails(movieId) ;
    return result.fold(
            (response) {
              var movieDetails = MoviesEntity(
                adult: response.adult,
                backdropPath: response.backdropPath,
                id: response.id,
                title: response.title,
                posterPath: response.posterPath,
                releaseDate: response.releaseDate,
                overview: response.overview,
                voteAverage: response.voteAverage,
                genres: response.genres,
              );
              return Left(movieDetails) ;
            },
            (error) => Right(error)
    );
  }

}