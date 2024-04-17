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
    as _i12;
import '../../data/datasource_contract/movie_details__datasource_contract.dart'
    as _i16;
import '../../data/datasource_contract/new_relealeses_datasource_contract.dart'
    as _i6;
import '../../data/datasource_contract/popular_movie_datasource_contract.dart'
    as _i18;
import '../../data/datasource_contract/recommended_movie_datasource_contract.dart'
    as _i25;
import '../../data/datasource_contract/search_datasource_contract.dart' as _i4;
import '../../data/datasource_contract/similar_datasource_contract.dart' as _i8;
import '../../data/datasourscs_impl/browse_movie_datasource_impl.dart' as _i13;
import '../../data/datasourscs_impl/movie_details__datasource_impl.dart'
    as _i17;
import '../../data/datasourscs_impl/new_relealeses_datasource_imp.dart' as _i7;
import '../../data/datasourscs_impl/popular_movie_datasource_impl.dart' as _i19;
import '../../data/datasourscs_impl/recommended_datasource_impl.dart' as _i26;
import '../../data/datasourscs_impl/search_datasource_impl.dart' as _i5;
import '../../data/datasourscs_impl/similar_datasource_impl.dart' as _i9;
import '../../data/repository_impl/browse_movie_repo_impl.dart' as _i29;
import '../../data/repository_impl/movie_details_repo_impl.dart' as _i32;
import '../../data/repository_impl/new_releases_repo_impl.dart' as _i21;
import '../../data/repository_impl/popular_movie_repo_impl.dart' as _i23;
import '../../data/repository_impl/recommended_movie_repo_impl.dart' as _i40;
import '../../data/repository_impl/search_repo_impl.dart' as _i15;
import '../../data/repository_impl/similar_repo_impl.dart' as _i11;
import '../../domain/repository_contract/browse_movie_repository.dart' as _i28;
import '../../domain/repository_contract/movies_details_repository.dart'
    as _i31;
import '../../domain/repository_contract/new_releases_repository.dart' as _i20;
import '../../domain/repository_contract/popular_movie_repository.dart' as _i22;
import '../../domain/repository_contract/recommended_movie_repository.dart'
    as _i39;
import '../../domain/repository_contract/search_repository.dart' as _i14;
import '../../domain/repository_contract/similar_repository.dart' as _i10;
import '../../domain/use_cases/home_use_case/browse_movie_use_case.dart'
    as _i38;
import '../../domain/use_cases/home_use_case/new_releases_use_case.dart'
    as _i24;
import '../../domain/use_cases/home_use_case/recommended_use_case.dart' as _i44;
import '../../domain/use_cases/home_use_case/top_side_use_case.dart' as _i27;
import '../../domain/use_cases/movie_details_screen_usecase/movie_details_screen_sec_section_use_case.dart'
    as _i30;
import '../../domain/use_cases/movie_details_screen_usecase/movie_details_screen_top_section_use_case.dart'
    as _i37;
import '../../domain/use_cases/search_use_case/search_use_case.dart' as _i36;
import '../../presentation/screens/category_screen/category_screen_view_model.dart'
    as _i43;
import '../../presentation/screens/home/tabs/home_tap/view_models/new_releases_view_model.dart'
    as _i34;
import '../../presentation/screens/home/tabs/home_tap/view_models/recommneded_view_model.dart'
    as _i45;
import '../../presentation/screens/home/tabs/home_tap/view_models/top_slide_view_model.dart'
    as _i33;
import '../../presentation/screens/home/tabs/search_tab/search_view_model.dart'
    as _i42;
import '../../presentation/screens/movie_details_screen/view_model/movie_details_sec_section_view_model.dart'
    as _i35;
import '../../presentation/screens/movie_details_screen/view_model/movie_details_top_section_view_model.dart'
    as _i41;
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
    gh.factory<_i4.SearchDatasourceContract>(
        () => _i5.SearchDatasourceImpl(gh<_i3.ApiManager>()));
    gh.factory<_i6.NewReleasesDataSourceContract>(
        () => _i7.NewReleasesDataSourceImpl(gh<_i3.ApiManager>()));
    gh.factory<_i8.SimilarDatasourceContract>(
        () => _i9.SimilarDataSourceImpl(gh<_i3.ApiManager>()));
    gh.factory<_i10.SimilarRepo>(
        () => _i11.SimilarRepoImpl(gh<_i8.SimilarDatasourceContract>()));
    gh.factory<_i12.BrowseMovieDatasourceContract>(
        () => _i13.BrowseMovieDatasourceImpl(gh<_i3.ApiManager>()));
    gh.factory<_i14.SearchRepo>(
        () => _i15.SearchRepoImpl(gh<_i4.SearchDatasourceContract>()));
    gh.factory<_i16.MovieDetailsDatasourceContract>(
        () => _i17.MovieDetailsDatasourceImpl(gh<_i3.ApiManager>()));
    gh.factory<_i18.PopularMovieDatasourceContract>(
        () => _i19.PopularMovieDatasourceImpl(apiManger: gh<_i3.ApiManager>()));
    gh.factory<_i20.NewReleasesRepo>(() =>
        _i21.NewReleasesRepoImpl(gh<_i6.NewReleasesDataSourceContract>()));
    gh.factory<_i22.PopularMovieRepo>(() => _i23.PopularMovieRepoImpl(
        popularMovieDatasource: gh<_i18.PopularMovieDatasourceContract>()));
    gh.factory<_i24.NewReleaseUseCase>(
        () => _i24.NewReleaseUseCase(gh<_i20.NewReleasesRepo>()));
    gh.factory<_i25.RecommendedMovieDatasourceContract>(
        () => _i26.RecommendedDatasourceImpl(apiManger: gh<_i3.ApiManager>()));
    gh.factory<_i27.TopSlideUseCase>(
        () => _i27.TopSlideUseCase(gh<_i22.PopularMovieRepo>()));
    gh.factory<_i28.BrowseMovieRepository>(() =>
        _i29.BrowseMovieRepoImpl(gh<_i12.BrowseMovieDatasourceContract>()));
    gh.factory<_i30.MovieDetailsSecSectionUseCase>(
        () => _i30.MovieDetailsSecSectionUseCase(gh<_i10.SimilarRepo>()));
    gh.factory<_i31.MovieDetailsRepo>(() =>
        _i32.MovieDetailsRepoImpl(gh<_i16.MovieDetailsDatasourceContract>()));
    gh.factory<_i33.TopSlideViewModel>(
        () => _i33.TopSlideViewModel(gh<_i27.TopSlideUseCase>()));
    gh.factory<_i34.NewReleasesViewModel>(
        () => _i34.NewReleasesViewModel(gh<_i24.NewReleaseUseCase>()));
    gh.factory<_i35.MovieDetailsSecSectionViewModel>(() =>
        _i35.MovieDetailsSecSectionViewModel(
            gh<_i30.MovieDetailsSecSectionUseCase>()));
    gh.factory<_i36.SearchUseCase>(
        () => _i36.SearchUseCase(gh<_i14.SearchRepo>()));
    gh.factory<_i37.MovieDetailsTopSectionUseCase>(
        () => _i37.MovieDetailsTopSectionUseCase(gh<_i31.MovieDetailsRepo>()));
    gh.factory<_i38.BrowseMovieUseCase>(
        () => _i38.BrowseMovieUseCase(gh<_i28.BrowseMovieRepository>()));
    gh.factory<_i39.RecommendedMovieRepo>(() => _i40.RecommendedMovieRepoImpl(
        gh<_i25.RecommendedMovieDatasourceContract>()));
    gh.factory<_i41.MovieDetailsTopSectionViewModel>(() =>
        _i41.MovieDetailsTopSectionViewModel(
            gh<_i37.MovieDetailsTopSectionUseCase>()));
    gh.factory<_i42.SearchViewModel>(
        () => _i42.SearchViewModel(gh<_i36.SearchUseCase>()));
    gh.factory<_i43.CategoryScreenViewModel>(
        () => _i43.CategoryScreenViewModel(gh<_i38.BrowseMovieUseCase>()));
    gh.factory<_i44.RecommendedUseCase>(
        () => _i44.RecommendedUseCase(gh<_i39.RecommendedMovieRepo>()));
    gh.factory<_i45.RecommendedViewModel>(
        () => _i45.RecommendedViewModel(gh<_i44.RecommendedUseCase>()));
    return this;
  }
}
