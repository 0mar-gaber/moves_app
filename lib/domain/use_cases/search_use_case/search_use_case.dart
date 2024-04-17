import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:moves_app/domain/repository_contract/search_repository.dart';

import '../../entities/movie_entity.dart';
@injectable
class SearchUseCase  {
  SearchRepo searchRepo ;
  @factoryMethod
  SearchUseCase(this.searchRepo);
  Future<Either<List<MoviesEntity>, String>> call(String query){
    return searchRepo.search(query);
  }

}