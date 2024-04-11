import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../domain/entities/popular_movie_entity.dart';
import '../../domain/repository_contract/popular_movie_repository.dart';
import '../datasource_contract/popular_movie_datasource_contract.dart';

@Injectable(as: PopularMovieRepo)
class PopularMovieRepoImpl extends PopularMovieRepo{
  PopularMovieDatasourceContract popularMovieDatasource ;
  @factoryMethod
  PopularMovieRepoImpl({required this.popularMovieDatasource});
  @override
  Future<Either<List<PopularMovieEntity>, String>> getPopularMovie() async {

    var result = await popularMovieDatasource.getPopularMovies();

   return result.fold(
            (response) {
              var responseList = response.results??[];
              var popularMovieList =  responseList.map((popularMovie) => PopularMovieEntity(adult: popularMovie.adult,backdropPath: popularMovie.backdropPath,id: popularMovie.id,title: popularMovie.title,posterPath: popularMovie.posterPath,releaseDate: popularMovie.releaseDate)).toList();
              return Left(popularMovieList);
            },
            (error) {
              return Right(error);
            }
    );

  }
}