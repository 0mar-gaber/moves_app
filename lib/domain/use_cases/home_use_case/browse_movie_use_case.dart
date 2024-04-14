import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:moves_app/domain/repository_contract/browse_movie_repository.dart';

import '../../entities/movie_entity.dart';
@injectable
class BrowseMovieUseCase{
  BrowseMovieRepository browseMovieRepository ;
  @factoryMethod
  BrowseMovieUseCase(this.browseMovieRepository);

  Future<Either<List<MoviesEntity>, String>> call(String categoryId){
    return browseMovieRepository.getFilteredMovies(categoryId: categoryId);
  }

}