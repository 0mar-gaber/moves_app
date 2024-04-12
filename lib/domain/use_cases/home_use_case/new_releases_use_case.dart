import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:moves_app/domain/entities/new_releases_entity.dart';
import 'package:moves_app/domain/repository_contract/new_releases_repository.dart';
@injectable
class NewReleaseUseCase{
  NewReleasesRepo newReleasesRepo ;
  @factoryMethod
  NewReleaseUseCase(this.newReleasesRepo);
  Future<Either<List<NewReleasesEntity>, String>> call(){
    return newReleasesRepo.getNewReleasesMovies();
  }
}