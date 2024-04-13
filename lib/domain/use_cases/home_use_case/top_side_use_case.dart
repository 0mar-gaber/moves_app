import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:moves_app/domain/repository_contract/popular_movie_repository.dart';

import '../../entities/movie_entity.dart';

@injectable
class TopSlideUseCase{
  PopularMovieRepo popularMovieRepo ;
  @factoryMethod
  TopSlideUseCase(this.popularMovieRepo);
  Future<Either<List<MoviesEntity>, String>> call(){
    return popularMovieRepo.getPopularMovie();
  }
}