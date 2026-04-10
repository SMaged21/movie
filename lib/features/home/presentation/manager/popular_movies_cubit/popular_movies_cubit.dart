import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie/features/home/data/model/movie_model/movie_model.dart';
import 'package:movie/features/home/data/model/repos/home_repo.dart';

part 'popular_movies_state.dart';

class PopularMoviesCubit extends Cubit<PopularMoviesState> {
  PopularMoviesCubit(this.movieRepo) : super(PopularMoviesInitial());

  final MovieRepo movieRepo;

  Future<void> fetchMovies() async {
    emit(PopularMoviesLoading());
    var response = await movieRepo.fetchPopularMovies();
    response.fold(
      (failure) {
        emit(PopularMoviesFailure());
      },
      (movies) {
        emit(PopularMoviesSuccess(movies: movies));
      },
    );
  }
}
