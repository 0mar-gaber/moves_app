import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:moves_app/core/DI/di.dart';
import 'package:moves_app/core/reusable_components/movie_details_movie_casing_components.dart';
import 'package:moves_app/domain/entities/movie_entity.dart';
import 'package:moves_app/presentation/screens/movie_details_screen/view_model/movie_details_top_section_view_model.dart';

import 'movie_type_component.dart';

class MovieDetailsComponent extends StatelessWidget {
  MoviesEntity moviesEntity;

  MovieDetailsComponent({super.key, required this.moviesEntity});

  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (context) => getIt<MovieDetailsTopSectionViewModel>()
        ..getMovieDetails(moviesEntity.id ?? 1011985),
      child: BlocBuilder<MovieDetailsTopSectionViewModel, MovieTopSectionDetailsState>(
        builder: (context, state) {
          if (state is MovieDetailsTopSectionErrorState) {
            return Center(
              child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.refresh,
                    color: Colors.red,
                    size: 100.sp,
                  )),
            );
          }
          if (state is MovieDetailsTopSectionSuccessState) {
            var movieDetails = state.moviesEntity;
            return Container(
              margin: REdgeInsets.only(left: 22),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  MovieDetailsMovieCasingComponents(moviesEntity: moviesEntity),
                  Expanded(
                    child: Container(
                      margin: REdgeInsets.only(left: 11),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          StaggeredGrid.count(
                            crossAxisCount: 4,
                            mainAxisSpacing: 4.h,
                            children: List.generate(movieDetails!.genres!.length, (index) => MovieTypeComponent(genreName: movieDetails.genres?[index].name,index: index,)),
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          Container(
                            margin: REdgeInsets.only(right: 19),
                            child: Text(
                              movieDetails.overview??"",
                              maxLines: 5,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.w300),
                            ),
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                "asset/icons/star-2.svg",
                                width: 20.w,
                                height: 19.13.h,
                              ),
                              SizedBox(width: 4.w),
                              Container(
                                  margin: REdgeInsets.only(top: 4),
                                  child: Text(
                                    movieDetails.voteAverage
                                            ?.toStringAsFixed(1) ??
                                        "",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 14.sp),
                                  ))
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            );
          }
          return SizedBox(
            height: 200.h,
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          );
        },
      ),
    );
  }
}
