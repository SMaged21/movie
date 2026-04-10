import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie/features/home/data/model/movie_details_model/movie_details_model.dart';
import 'package:movie/features/home/data/model/repos/home_repo.dart';
part 'movies_details_state.dart';

class MoviesDetailsCubit extends Cubit<MoviesDetailsState> {
  MoviesDetailsCubit(this.movieRepo) : super(MoviesDetailsInitial());

  final MovieRepo movieRepo;

  Future<void> fetchDetails(int id) async {
    emit(MoviesDetailsLoading());
    var response = await movieRepo.fetchMovieDetails(id);
    response.fold(
      (failure) {
        emit(MoviesDetailsFailure(errMessage: failure.toString()));
      },
      (movie) {
        emit(MoviesDetailsSuccess(movie: movie));
      },
    );
  }
}
