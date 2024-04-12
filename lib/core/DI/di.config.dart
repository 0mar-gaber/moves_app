// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../data/datasource_contract/new_relealeses_datasource_contract.dart'
    as _i4;
import '../../data/datasource_contract/popular_movie_datasource_contract.dart'
    as _i6;
import '../../data/datasource_contract/recommended_movie_datasource_contract.dart'
    as _i13;
import '../../data/datasourscs_impl/new_relealeses_datasource_imp.dart' as _i5;
import '../../data/datasourscs_impl/popular_movie_datasource_impl.dart' as _i7;
import '../../data/datasourscs_impl/recommended_datasource_impl.dart' as _i14;
import '../../data/repository_impl/new_releases_repo_impl.dart' as _i9;
import '../../data/repository_impl/popular_movie_repo_impl.dart' as _i11;
import '../../data/repository_impl/recommended_movie_repo_impl.dart' as _i19;
import '../../domain/repository_contract/new_releases_repository.dart' as _i8;
import '../../domain/repository_contract/popular_movie_repository.dart' as _i10;
import '../../domain/repository_contract/recommended_movie_repository.dart'
    as _i18;
import '../../domain/use_cases/home_use_case/new_releases_use_case.dart'
    as _i12;
import '../../domain/use_cases/home_use_case/recommended_use_case.dart' as _i20;
import '../../domain/use_cases/home_use_case/top_side_use_case.dart' as _i15;
import '../../presentation/screens/home/tabs/home_tap/view_models/new_releases_view_model.dart'
    as _i17;
import '../../presentation/screens/home/tabs/home_tap/view_models/recommneded_view_model.dart'
    as _i21;
import '../../presentation/screens/home/tabs/home_tap/view_models/top_slide_view_model.dart'
    as _i16;
import '../api/api_manger.dart' as _i3;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i3.ApiManager>(() => _i3.ApiManager());
    gh.factory<_i4.NewReleasesDataSourceContract>(
        () => _i5.NewReleasesDataSourceImpl(gh<_i3.ApiManager>()));
    gh.factory<_i6.PopularMovieDatasourceContract>(
        () => _i7.PopularMovieDatasourceImpl(apiManger: gh<_i3.ApiManager>()));
    gh.factory<_i8.NewReleasesRepo>(
        () => _i9.NewReleasesRepoImpl(gh<_i4.NewReleasesDataSourceContract>()));
    gh.factory<_i10.PopularMovieRepo>(() => _i11.PopularMovieRepoImpl(
        popularMovieDatasource: gh<_i6.PopularMovieDatasourceContract>()));
    gh.factory<_i12.NewReleaseUseCase>(
        () => _i12.NewReleaseUseCase(gh<_i8.NewReleasesRepo>()));
    gh.factory<_i13.RecommendedMovieDatasourceContract>(
        () => _i14.RecommendedDatasourceImpl(apiManger: gh<_i3.ApiManager>()));
    gh.factory<_i15.TopSlideUseCase>(
        () => _i15.TopSlideUseCase(gh<_i10.PopularMovieRepo>()));
    gh.factory<_i16.TopSlideViewModel>(
        () => _i16.TopSlideViewModel(gh<_i15.TopSlideUseCase>()));
    gh.factory<_i17.NewReleasesViewModel>(
        () => _i17.NewReleasesViewModel(gh<_i12.NewReleaseUseCase>()));
    gh.factory<_i18.RecommendedMovieRepo>(() => _i19.RecommendedMovieRepoImpl(
        gh<_i13.RecommendedMovieDatasourceContract>()));
    gh.factory<_i20.RecommendedUseCase>(
        () => _i20.RecommendedUseCase(gh<_i18.RecommendedMovieRepo>()));
    gh.factory<_i21.RecommendedViewModel>(
        () => _i21.RecommendedViewModel(gh<_i20.RecommendedUseCase>()));
    return this;
  }
}
