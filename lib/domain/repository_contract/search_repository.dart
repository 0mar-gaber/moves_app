import 'package:dartz/dartz.dart';
import 'package:moves_app/domain/entities/movie_entity.dart';

abstract class SearchRepo{
  Future<Either<List<MoviesEntity>,String>> search(String query);
}