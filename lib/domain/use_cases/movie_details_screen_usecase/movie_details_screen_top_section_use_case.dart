import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:moves_app/domain/repository_contract/movies_details_repository.dart';

import '../../entities/movie_entity.dart';
@injectable
class MovieDetailsTopSectionUseCase{
  MovieDetailsRepo movieDetailsRepo ;
  @factoryMethod
  MovieDetailsTopSectionUseCase(this.movieDetailsRepo);
  Future<Either<MoviesEntity, String>> call(int movieId){
    return movieDetailsRepo.getMovieDetails(movieId);
  }
}