import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:moves_app/domain/entities/movie_entity.dart';

import '../../../../../domain/use_cases/search_use_case/search_use_case.dart';
@injectable
class SearchViewModel extends Cubit<SearchState>{
  SearchUseCase searchUseCase ;
  @factoryMethod
  SearchViewModel(this.searchUseCase):super(SearchInitState());
  search(String query) async {
    var result = await searchUseCase.call(query);
    return result.fold(
            (moviesList) => emit(SearchSuccessState(moviesList)),
            (error) => emit(SearchErrorState(error))
    );
  }

}
abstract class SearchState{}
class SearchInitState extends SearchState{}
class SearchLoadingState extends SearchState{}
class SearchErrorState extends SearchState{
  String? errorMessage ;
  SearchErrorState(this.errorMessage);
}
class SearchSuccessState extends SearchState{
  List<MoviesEntity>? moviesList ;
  SearchSuccessState(this.moviesList);
}