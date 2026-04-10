part of 'movies_details_cubit.dart';

sealed class MoviesDetailsState extends Equatable {
  const MoviesDetailsState();

  @override
  List<Object> get props => [];
}

final class MoviesDetailsInitial extends MoviesDetailsState {}

final class MoviesDetailsFailure extends MoviesDetailsState {
  final String errMessage;

  const MoviesDetailsFailure({required this.errMessage});

  @override
  List<Object> get props => [errMessage];
}

final class MoviesDetailsSuccess extends MoviesDetailsState {
  final MovieDetailsModel movie;

  const MoviesDetailsSuccess({required this.movie});

  @override
  List<Object> get props => [movie];
}

final class MoviesDetailsLoading extends MoviesDetailsState {}
