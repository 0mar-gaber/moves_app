import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:moves_app/core/DI/di.dart';
import 'package:moves_app/presentation/screens/home/tabs/watch_list_tab/watch_list_view_model.dart';
import 'package:moves_app/presentation/screens/movie_details_screen/movie_details_screen.dart';

import '../../../../../core/reusable_components/movie_component.dart';

class WatchListTab extends StatelessWidget {
  const WatchListTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            margin: REdgeInsets.only(
                top:77.49 ,
                left: 17
            ),
            child: Text("Watchlist",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 22.sp,
                    fontWeight: FontWeight.w400))),
        Expanded(
          child: BlocProvider(
            create: (context) => getIt<WatchListViewModel>()..getMovies(FirebaseAuth.instance.currentUser!.uid),
            child: BlocBuilder<WatchListViewModel,WatchListState>(
              builder: (context, state) {

                if(state is WatchListErrorState){
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
                if(state is WatchListSuccessState){
                  var moviesList = state.movies;
                  if(moviesList!.isEmpty){
                    return Center(
                      child: Column(
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
                      ),
                    );
                  }else {
                    return ListView.builder(
                    padding: REdgeInsets.only(
                      top: 15,
                      left: 15,
                      right: 15
                    ),
                      itemBuilder: (context, index) => InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, MovieDetails.route,arguments: moviesList[index]);
                        },
                          child: MovieWidget(moviesEntity: moviesList[index])),
                    itemCount: moviesList.length,
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
