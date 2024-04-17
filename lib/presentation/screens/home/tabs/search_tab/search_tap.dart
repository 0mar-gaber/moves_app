import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:moves_app/core/DI/di.dart';
import 'package:moves_app/presentation/screens/home/home_screen_provider.dart';
import 'package:moves_app/presentation/screens/home/tabs/search_tab/search_view_model.dart';
import 'package:moves_app/presentation/screens/movie_details_screen/movie_details_screen.dart';
import 'package:provider/provider.dart';

import '../../../../../core/reusable_components/movie_component.dart';

class SearchTab extends StatefulWidget {
  const SearchTab({super.key});

  @override
  State<SearchTab> createState() => _SearchTabState();
}

class _SearchTabState extends State<SearchTab> {

  @override
  Widget build(BuildContext context) {
    HomeScreenProvider searchProvider = Provider.of<HomeScreenProvider>(context);
    return Column(
      children: [
        Container(
          margin: REdgeInsets.only(left: 35, right: 34, top: 43),
          child: TextField(
            onChanged: (value) {
              searchProvider.changeSearchQuery(value);
            },
            style: TextStyle(color: Colors.white, fontSize: 14.sp),
            cursorColor: Colors.white,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white, width: 1.w),
                borderRadius: BorderRadius.circular(30).w,
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white, width: 1.w),
                borderRadius: BorderRadius.circular(60),
              ),
              prefixIcon: Padding(
                padding: REdgeInsets.only(
                  left: 17,
                ),
                child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.search_outlined,
                      size: 15.9.sp,
                    )),
              ),
              prefixIconColor: Colors.white,
              hintText: "Search",
              hintStyle: TextStyle(
                color: Colors.white.withOpacity(0.46),
                fontSize: 14.sp,
                fontWeight: FontWeight.w300,
              ),
              filled: true,
              fillColor: Theme.of(context).colorScheme.errorContainer,
            ),
          ),
        ),
        SizedBox(height: 29.h),
        Expanded(
          child: searchProvider.isSearchEmpty
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      "asset/icons/film strip.svg",
                      width: 78.09.w,
                      height: 87.86.h,
                    ),
                    SizedBox(height: 10.64.h),
                    Text(
                      "No movies found",
                      style: TextStyle(color: Colors.white24, fontSize: 13.sp),
                    ),
                  ],
                )
              : BlocProvider.value(
                  value:  getIt<SearchViewModel>()
                    ..search(searchProvider.searchQuery),
                  child: BlocBuilder<SearchViewModel, SearchState>(
                    builder: (context, state) {
                      if (state is SearchErrorState) {
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
                      if (state is SearchSuccessState) {
                        var searchMoviesList = state.moviesList;
                        if(searchMoviesList!.isEmpty){
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                "asset/icons/film strip.svg",
                                width: 78.09.w,
                                height: 87.86.h,
                              ),
                              SizedBox(height: 10.64.h),
                              Text(
                                "No movies found",
                                style: TextStyle(color: Colors.white24, fontSize: 13.sp),
                              ),
                            ],
                          );
                        }else {
                          return Container(
                          margin: REdgeInsets.only(
                            left: 15,
                            right: 15,
                          ),
                          child: ListView.builder(
                            itemBuilder: (context, index) => InkWell(
                              onTap: () {
                                Navigator.pushNamed(context, MovieDetails.route,arguments: searchMoviesList[index]);
                              },
                              child: MovieWidget(
                                moviesEntity: searchMoviesList[index],
                              ),
                            ),
                            itemCount: searchMoviesList.length,
                          ),
                        );
                        }
                      }
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    },
                  ),
                ),
        ),
      ],
    );
  }
}
