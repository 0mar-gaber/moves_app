import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moves_app/core/DI/di.dart';
import 'package:moves_app/core/reusable_components/more_like_this_component.dart';
import 'package:moves_app/domain/entities/movie_entity.dart';
import 'package:moves_app/presentation/screens/category_screen/category_screen_view_model.dart';
import 'package:moves_app/presentation/screens/movie_details_screen/view_model/movie_details_sec_section_view_model.dart';

import '../../../core/reusable_components/move_details_casing_component.dart';
import '../../../core/reusable_components/move_details_component.dart';

class MovieDetails extends StatelessWidget {
  static const route = "MovieDetails";

  const MovieDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final movie = ModalRoute
        .of(context)
        ?.settings
        .arguments as MoviesEntity?;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          movie?.title ?? "",
          style: const TextStyle(color: Colors.white),
        ),
        iconTheme: IconThemeData(color: Colors.white, size: 20.sp),
        toolbarHeight: 58.h,
      ),
      body: ListView(
        children: [
          MovieDetailsCasing(
            moviesEntity: movie!,
          ),
          SizedBox(height: 20.h,),
          MovieDetailsComponent(moviesEntity: movie),

          SizedBox(height: 18.h,),
          Container(
            height: 280.h,
            color: Theme
                .of(context)
                .colorScheme
                .onSurface,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    margin: REdgeInsets.only(
                      top: 10.13,
                      left: 17,
                    ),
                    child: Text("More like this",
                      style: TextStyle(color: Colors.white, fontSize: 15.sp),)),
                Expanded(
                  child: BlocProvider(
                    create: (context) =>
                    getIt<MovieDetailsSecSectionViewModel>()
                      ..getMovieDetails(movie.id ?? 1011985),
                    child: BlocBuilder<
                        MovieDetailsSecSectionViewModel,
                        MovieDetailsSecSectionState>(
                      builder: (context, state) {
                        if (state is MovieDetailsSecSectionErrorState) {
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
                        if (state is MovieDetailsSecSectionSuccessState) {
                          var similarList = state.moviesEntity??[];
                          return ListView.separated(
                            padding: REdgeInsets.only(
                                left: 17,
                                top: 14.87,
                                bottom: 17,
                                right: 17
                            ),
                            itemBuilder: (context, index) => InkWell(
                              onTap: () {
                                Navigator.pushNamed(context, MovieDetails.route,arguments: similarList[index]);
                              },
                                child: MoreLikeThisComponent(moviesEntity: similarList[index],)),
                            scrollDirection: Axis.horizontal,
                            separatorBuilder: (context, index) =>
                                SizedBox(width: 14.w),
                            itemCount: similarList.length,
                          );
                      }
                        return const Center(
                          child: CircularProgressIndicator()
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 40.h,),
        ],
      ),
    );
  }
}
