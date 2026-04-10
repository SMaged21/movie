import 'package:dartz/dartz.dart';
import 'package:movie/core/errs/failure.dart';
import 'package:movie/core/utils/api_service.dart';
import 'package:movie/features/home/data/model/movie_details_model/movie_details_model.dart';
import 'package:movie/features/home/data/model/movie_model/movie_model.dart';
import 'package:movie/features/home/data/model/repos/home_repo.dart';

class MovieRepoImpl implements MovieRepo {
  final ApiService apiService;

  MovieRepoImpl({required this.apiService});
  @override
  Future<Either<Failure, List<MovieModel>>> fetchPopularMovies() async {
    try {
      final response = await apiService.get("popular");
      final List movies = response['results'];

      final List<MovieModel> movieList = movies
          .map((e) => MovieModel.fromJson(e))
          .toList();

      return right(movieList);
    } catch (e) {
      return left(ServerFailure(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, MovieDetailsModel>> fetchMovieDetails(
    int movieId,
  ) async {
    try {
      final response = await apiService.get("$movieId");

      final MovieDetailsModel movie = MovieDetailsModel.fromJson(response);
      return right(movie);
    } catch (e) {
      return left(ServerFailure(errMessage: e.toString()));
    }
  }
}
