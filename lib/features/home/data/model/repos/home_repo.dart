import 'package:dartz/dartz.dart';
import 'package:movie/core/errs/failure.dart';
import 'package:movie/features/home/data/model/movie_details_model/movie_details_model.dart';
import 'package:movie/features/home/data/model/movie_model/movie_model.dart';

abstract class MovieRepo {
  Future<Either<Failure, List<MovieModel>>> fetchPopularMovies();
  Future<Either<Failure, MovieDetailsModel>> fetchMovieDetails(int id);
}
