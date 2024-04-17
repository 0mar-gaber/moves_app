// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../data/datasource_contract/browse_movie_datasource_contract.dart'
    as _i10;
import '../../data/datasource_contract/movie_details__datasource_contract.dart'
    as _i12;
import '../../data/datasource_contract/new_relealeses_datasource_contract.dart'
    as _i4;
import '../../data/datasource_contract/popular_movie_datasource_contract.dart'
    as _i14;
import '../../data/datasource_contract/recommended_movie_datasource_contract.dart'
    as _i21;
import '../../data/datasource_contract/similar_datasource_contract.dart' as _i6;
import '../../data/datasourscs_impl/browse_movie_datasource_impl.dart' as _i11;
import '../../data/datasourscs_impl/movie_details__datasource_impl.dart'
    as _i13;
import '../../data/datasourscs_impl/new_relealeses_datasource_imp.dart' as _i5;
import '../../data/datasourscs_impl/popular_movie_datasource_impl.dart' as _i15;
import '../../data/datasourscs_impl/recommended_datasource_impl.dart' as _i22;
import '../../data/datasourscs_impl/similar_datasource_impl.dart' as _i7;
import '../../data/repository_impl/browse_movie_repo_impl.dart' as _i25;
import '../../data/repository_impl/movie_details_repo_impl.dart' as _i28;
import '../../data/repository_impl/new_releases_repo_impl.dart' as _i17;
import '../../data/repository_impl/popular_movie_repo_impl.dart' as _i19;
import '../../data/repository_impl/recommended_movie_repo_impl.dart' as _i35;
import '../../data/repository_impl/similar_repo_impl.dart' as _i9;
import '../../domain/repository_contract/browse_movie_repository.dart' as _i24;
import '../../domain/repository_contract/movies_details_repository.dart'
    as _i27;
import '../../domain/repository_contract/new_releases_repository.dart' as _i16;
import '../../domain/repository_contract/popular_movie_repository.dart' as _i18;
import '../../domain/repository_contract/recommended_movie_repository.dart'
    as _i34;
import '../../domain/repository_contract/similar_repository.dart' as _i8;
import '../../domain/use_cases/home_use_case/browse_movie_use_case.dart'
    as _i33;
import '../../domain/use_cases/home_use_case/new_releases_use_case.dart'
    as _i20;
import '../../domain/use_cases/home_use_case/recommended_use_case.dart' as _i38;
import '../../domain/use_cases/home_use_case/top_side_use_case.dart' as _i23;
import '../../domain/use_cases/movie_details_screen_usecase/movie_details_screen_sec_section_use_case.dart'
    as _i26;
import '../../domain/use_cases/movie_details_screen_usecase/movie_details_screen_top_section_use_case.dart'
    as _i32;
import '../../presentation/screens/category_screen/category_screen_view_model.dart'
    as _i37;
import '../../presentation/screens/home/tabs/home_tap/view_models/new_releases_view_model.dart'
    as _i30;
import '../../presentation/screens/home/tabs/home_tap/view_models/recommneded_view_model.dart'
    as _i39;
import '../../presentation/screens/home/tabs/home_tap/view_models/top_slide_view_model.dart'
    as _i29;
import '../../presentation/screens/movie_details_screen/view_model/movie_details_sec_section_view_model.dart'
    as _i31;
import '../../presentation/screens/movie_details_screen/view_model/movie_details_top_section_view_model.dart'
    as _i36;
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
    gh.factory<_i6.SimilarDatasourceContract>(
        () => _i7.SimilarDataSourceImpl(gh<_i3.ApiManager>()));
    gh.factory<_i8.SimilarRepo>(
        () => _i9.SimilarRepoImpl(gh<_i6.SimilarDatasourceContract>()));
    gh.factory<_i10.BrowseMovieDatasourceContract>(
        () => _i11.BrowseMovieDatasourceImpl(gh<_i3.ApiManager>()));
    gh.factory<_i12.MovieDetailsDatasourceContract>(
        () => _i13.MovieDetailsDatasourceImpl(gh<_i3.ApiManager>()));
    gh.factory<_i14.PopularMovieDatasourceContract>(
        () => _i15.PopularMovieDatasourceImpl(apiManger: gh<_i3.ApiManager>()));
    gh.factory<_i16.NewReleasesRepo>(() =>
        _i17.NewReleasesRepoImpl(gh<_i4.NewReleasesDataSourceContract>()));
    gh.factory<_i18.PopularMovieRepo>(() => _i19.PopularMovieRepoImpl(
        popularMovieDatasource: gh<_i14.PopularMovieDatasourceContract>()));
    gh.factory<_i20.NewReleaseUseCase>(
        () => _i20.NewReleaseUseCase(gh<_i16.NewReleasesRepo>()));
    gh.factory<_i21.RecommendedMovieDatasourceContract>(
        () => _i22.RecommendedDatasourceImpl(apiManger: gh<_i3.ApiManager>()));
    gh.factory<_i23.TopSlideUseCase>(
        () => _i23.TopSlideUseCase(gh<_i18.PopularMovieRepo>()));
    gh.factory<_i24.BrowseMovieRepository>(() =>
        _i25.BrowseMovieRepoImpl(gh<_i10.BrowseMovieDatasourceContract>()));
    gh.factory<_i26.MovieDetailsSecSectionUseCase>(
        () => _i26.MovieDetailsSecSectionUseCase(gh<_i8.SimilarRepo>()));
    gh.factory<_i27.MovieDetailsRepo>(() =>
        _i28.MovieDetailsRepoImpl(gh<_i12.MovieDetailsDatasourceContract>()));
    gh.factory<_i29.TopSlideViewModel>(
        () => _i29.TopSlideViewModel(gh<_i23.TopSlideUseCase>()));
    gh.factory<_i30.NewReleasesViewModel>(
        () => _i30.NewReleasesViewModel(gh<_i20.NewReleaseUseCase>()));
    gh.factory<_i31.MovieDetailsSecSectionViewModel>(() =>
        _i31.MovieDetailsSecSectionViewModel(
            gh<_i26.MovieDetailsSecSectionUseCase>()));
    gh.factory<_i32.MovieDetailsTopSectionUseCase>(
        () => _i32.MovieDetailsTopSectionUseCase(gh<_i27.MovieDetailsRepo>()));
    gh.factory<_i33.BrowseMovieUseCase>(
        () => _i33.BrowseMovieUseCase(gh<_i24.BrowseMovieRepository>()));
    gh.factory<_i34.RecommendedMovieRepo>(() => _i35.RecommendedMovieRepoImpl(
        gh<_i21.RecommendedMovieDatasourceContract>()));
    gh.factory<_i36.MovieDetailsTopSectionViewModel>(() =>
        _i36.MovieDetailsTopSectionViewModel(
            gh<_i32.MovieDetailsTopSectionUseCase>()));
    gh.factory<_i37.CategoryScreenViewModel>(
        () => _i37.CategoryScreenViewModel(gh<_i33.BrowseMovieUseCase>()));
    gh.factory<_i38.RecommendedUseCase>(
        () => _i38.RecommendedUseCase(gh<_i34.RecommendedMovieRepo>()));
    gh.factory<_i39.RecommendedViewModel>(
        () => _i39.RecommendedViewModel(gh<_i38.RecommendedUseCase>()));
    return this;
  }
}
