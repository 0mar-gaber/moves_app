import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:moves_app/domain/repository_contract/similar_repository.dart';

import '../../entities/movie_entity.dart';
@injectable
class MovieDetailsSecSectionUseCase{
  SimilarRepo similarRepo ;
  @factoryMethod
  MovieDetailsSecSectionUseCase(this.similarRepo);
  Future<Either<List<MoviesEntity>, String>> call(int movieId){
    return similarRepo.getSimilarMovies(movieId);
  }
}