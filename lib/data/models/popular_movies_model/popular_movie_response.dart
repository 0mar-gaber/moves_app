import 'package:moves_app/data/models/popular_movies_model/popular_movie_results.dart';

class PopularMovieResponse {
  final int page;
  final List<PopularMovieResult> results;
  final int totalPages;
  final int totalResults;

  PopularMovieResponse({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  factory PopularMovieResponse.fromJson(Map<String, dynamic> json) {
    return PopularMovieResponse(
      page: json['page'],
      results: List<PopularMovieResult>.from(json['results'].map((x) => PopularMovieResult.fromJson(x))),
      totalPages: json['total_pages'],
      totalResults: json['total_results'],
    );
  }
}
