import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/entities/movie_entity.dart';
import '../../../domain/use_cases/home_use_case/browse_movie_use_case.dart';
@injectable
class CategoryScreenViewModel extends Cubit<CategoryScreenState>{
  BrowseMovieUseCase browseMovieUseCase ;
  @factoryMethod
  CategoryScreenViewModel(this.browseMovieUseCase):super(CategoryScreenInitState());

  getFilteredMovies(String categoryId) async {
    emit(CategoryScreenLoadingState());
    var result = await browseMovieUseCase.call(categoryId);
    result.fold(
            (movies) => emit(CategoryScreenSuccessState(filteredMoviesList: movies)),
            (error) => emit(CategoryScreenErrorState(errorMessage: error.toString()))
    );
  }

}

abstract class CategoryScreenState{}

class CategoryScreenInitState extends CategoryScreenState{}

class CategoryScreenLoadingState extends CategoryScreenState{}

class CategoryScreenErrorState extends CategoryScreenState{
  String? errorMessage ;
  CategoryScreenErrorState({this.errorMessage});
}

class CategoryScreenSuccessState extends CategoryScreenState{
  List<MoviesEntity>? filteredMoviesList ;
  CategoryScreenSuccessState({this.filteredMoviesList});
}