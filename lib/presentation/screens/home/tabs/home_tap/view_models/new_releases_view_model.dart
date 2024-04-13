import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../domain/entities/movie_entity.dart';
import '../../../../../../domain/use_cases/home_use_case/new_releases_use_case.dart';


@injectable

class NewReleasesViewModel extends Cubit<NewReleasesState>{
  NewReleaseUseCase newReleaseUseCase ;
  @factoryMethod
  NewReleasesViewModel(this.newReleaseUseCase):super(NewReleasesInitState());

  getNewReleasesMovies() async {
    emit(NewReleasesLoading());
    var result = await newReleaseUseCase.call();
    result.fold(
            (movies) => emit(NewReleasesSuccess(movies)),
            (error) => emit(NewReleasesError(error.toString()))
    );
  }

}
abstract class NewReleasesState{}
class NewReleasesInitState extends NewReleasesState{}

class NewReleasesLoading extends NewReleasesState{}

class NewReleasesSuccess extends NewReleasesState{
  List<MoviesEntity>? newReleasesList ;
  NewReleasesSuccess(this.newReleasesList);

}

class NewReleasesError extends NewReleasesState{
  String? errorMessage ;
  NewReleasesError(this.errorMessage);
}
