import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:moves_app/domain/repository_contract/new_releases_repository.dart';

import '../../entities/movie_entity.dart';
@injectable
class NewReleaseUseCase{
  NewReleasesRepo newReleasesRepo ;
  @factoryMethod
  NewReleaseUseCase(this.newReleasesRepo);
  Future<Either<List<MoviesEntity>, String>> call(){
    return newReleasesRepo.getNewReleasesMovies();
  }
}