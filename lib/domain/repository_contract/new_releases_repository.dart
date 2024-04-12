import 'package:dartz/dartz.dart';
import 'package:moves_app/domain/entities/new_releases_entity.dart';

abstract class NewReleasesRepo{
  Future<Either<List<NewReleasesEntity>,String>> getNewReleasesMovies();
}