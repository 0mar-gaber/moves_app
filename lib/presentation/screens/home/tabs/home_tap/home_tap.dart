import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moves_app/core/DI/di.dart';
import 'package:moves_app/presentation/screens/home/tabs/home_tap/view_models/new_releases_view_model.dart';
import 'package:moves_app/presentation/screens/home/tabs/home_tap/view_models/recommneded_view_model.dart';
import 'package:moves_app/presentation/screens/home/tabs/home_tap/view_models/top_slide_view_model.dart';
import 'package:moves_app/presentation/shared_provider/shared_provider.dart';
import 'package:provider/provider.dart';
import '../../../../../core/reusable_components/new_releases_component.dart';
import '../../../../../core/reusable_components/recommended_component.dart';
import '../../../../../core/reusable_components/slide_component.dart';
import '../../../movie_details_screen/movie_details_screen.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      BlocProvider(
        create: (context) => getIt<TopSlideViewModel>()..getTopSideMovies(),
        child: BlocBuilder<TopSlideViewModel, TopSlideState>(
          builder: (BuildContext context, TopSlideState state) {
            if (state is TopSlideError) {
              return IconButton(
                  onPressed: () {
                    getIt<TopSlideViewModel>().getTopSideMovies();
                  },
                  icon: Icon(
                    Icons.refresh,
                    color: Colors.red,
                    size: 100.sp,
                  ));
            }
            if (state is TopSlideSuccess) {
              var topSideMovesList = state.popularMoviesList ?? [];
              return CarouselSlider.builder(
                itemBuilder: (context, index, realIndex) => InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, MovieDetails.route,arguments: topSideMovesList[index]);
                  },
                  child: SlideComponent(
                      popularMovieEntity: topSideMovesList[index]),
                ),
                options: CarouselOptions(
                  height: 327.h,
                  autoPlay: true,
                  viewportFraction: 1,
                ),
                itemCount: topSideMovesList.length,
              );
            }
            return SizedBox(
              width:double.infinity ,
              height: 327.h,
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            );
          },
        ),
      ),
      Container(
        height: 200.h,
        color: Theme.of(context).colorScheme.onSurface,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                margin: REdgeInsets.only(top: 15.13, left: 19),
                child: Text(
                  "New Releases ",
                  style: TextStyle(color: Colors.white, fontSize: 15.sp),
                )),
            BlocProvider(
              create: (context) => getIt<NewReleasesViewModel>()..getNewReleasesMovies(),
              child: BlocBuilder<NewReleasesViewModel, NewReleasesState>(
                builder: (context, state) {
                  if (state is NewReleasesError) {
                    print(state.errorMessage);
                    return Expanded(
                      child: IconButton(
                          onPressed: () {
                            getIt<NewReleasesViewModel>().getNewReleasesMovies();},
                          icon: Icon(
                            Icons.refresh,
                            color: Colors.red,
                            size: 100.sp,
                          )),
                    );
                  }
                  if (state is NewReleasesSuccess) {
                    var newReleasesMovieList = state.newReleasesList??[];
                    return Expanded(
                      child: ListView.separated(
                        padding: REdgeInsets.only(
                          top: 12.87,
                          left: 19,
                          bottom: 13.3,
                          right: 19,
                        ),
                        itemBuilder: (context, index) => InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, MovieDetails.route,arguments: newReleasesMovieList[index]);
                            },
                            child: NewReleasesComponent(newReleasesEntity: newReleasesMovieList[index])),
                        scrollDirection: Axis.horizontal,
                        itemCount: newReleasesMovieList.length,
                        separatorBuilder: (context, index) => SizedBox(
                          width: 13.w,
                        ),
                      ),
                    );
                  }
                  return const Expanded(child: Center(child: CircularProgressIndicator()));
                },
              ),
            )
          ],
        ),
      ),
      SizedBox(height: 30.h),
      Container(
        height: 280.h,
        color: Theme.of(context).colorScheme.onSurface,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                margin: REdgeInsets.only(
                  top: 10.13,
                  left: 17,
                ),
                child: Text(
                  "Recommended",
                  style: TextStyle(color: Colors.white, fontSize: 15.sp),
                )),
            BlocProvider(
              create: (context) => getIt<RecommendedViewModel>()..getRecommendedMovies(),
              child: BlocBuilder<RecommendedViewModel,RecommendedState>(
                builder: (context, state) {
                  if(state is RecommendedError){
                    print(state.errorMessage);
                    return Expanded(
                      child: IconButton(
                          onPressed: () {
                            getIt<RecommendedViewModel>().getRecommendedMovies();},
                          icon: Icon(
                            Icons.refresh,
                            color: Colors.red,
                            size: 100.sp,
                          )),
                    );                  }
                  if(state is RecommendedSuccess){
                    var recommendedMoviesList = state.moviesList??[];
                    return Expanded(
                      child: ListView.separated(
                        padding: REdgeInsets.only(
                            left: 17, top: 14.87, bottom: 17, right: 17),
                        itemBuilder: (context, index) => InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, MovieDetails.route,arguments: recommendedMoviesList[index]);
                          },
                            child: RecommendedComponent(recommendedEntity: recommendedMoviesList[index],)),
                        scrollDirection: Axis.horizontal,
                        separatorBuilder: (context, index) => SizedBox(width: 14.w),
                        itemCount: recommendedMoviesList.length,
                      ),
                    );
                  }
                  return const Expanded(
                        child: Center(
                          child: CircularProgressIndicator(),
                        )
                    );

                },
              ),
            )

          ],
        ),
      ),
      SizedBox(
        height: 22.h,
      ),
    ]);
  }
}
