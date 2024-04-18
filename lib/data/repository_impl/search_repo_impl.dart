import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:moves_app/domain/entities/movie_entity.dart';
import 'package:moves_app/domain/repository_contract/search_repository.dart';

import '../api_datasource_contract/search_datasource_contract.dart';
@Injectable(as:SearchRepo)
class SearchRepoImpl extends SearchRepo{
  SearchDatasourceContract searchDatasourceContract ;
  @factoryMethod
  SearchRepoImpl(this.searchDatasourceContract);
  @override
  Future<Either<List<MoviesEntity>, String>> search(String query) async {
   var searchResult = await searchDatasourceContract.search(query);
   return searchResult.fold(
           (response){
         var responseList = response.results??[];
         var searchList = responseList.map((searchMovie) => MoviesEntity(
           title: searchMovie.title,
           overview: searchMovie.overview,
           adult: searchMovie.adult,
           releaseDate: searchMovie.releaseDate,
           posterPath: searchMovie.posterPath,
           backdropPath: searchMovie.backdropPath,
           id: searchMovie.id,
           voteAverage: searchMovie.voteAverage,
         )).toList();
         return Left(searchList);

       },
           (error) => Right(error)
   );
  }

}