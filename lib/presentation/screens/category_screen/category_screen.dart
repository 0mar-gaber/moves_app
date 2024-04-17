import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moves_app/core/reusable_components/movie_component.dart';
import 'package:moves_app/presentation/screens/movie_details_screen/movie_details_screen.dart';
import '../../../core/DI/di.dart';
import 'category_screen_view_model.dart';

class CategoryScreen extends StatelessWidget {
  static const String route = "category screen" ;
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic>? categoryData = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    var categoryId = categoryData!["id"];
    var categoryName = categoryData["name"].toString();
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryName,style: TextStyle(color: Colors.white,fontSize: width*0.03),),
        iconTheme: IconThemeData(color: Colors.white,size: width*0.04),
        toolbarHeight: height*0.05,
      ),
      body: BlocProvider(
        create: (context) => getIt<CategoryScreenViewModel>()..getFilteredMovies(categoryId.toString()),
        child: BlocBuilder<CategoryScreenViewModel,CategoryScreenState>(
          builder: (context, state) {
            if(state is CategoryScreenErrorState){
              print(state.errorMessage);
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
            if(state is CategoryScreenSuccessState){
              var moviesList = state.filteredMoviesList??[];
              return ListView.builder(
                padding: REdgeInsets.all(10),
                itemBuilder: (context, index) => InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, MovieDetails.route,arguments: moviesList[index]);
                    },
                    child: MovieWidget(moviesEntity: moviesList[index],)),
                itemCount: moviesList.length,
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
