import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/features/home/presentation/manager/movies_details_cubit/movies_details_cubit.dart';
import 'package:movie/features/home/presentation/views/widgets/movies_details_view_body.dart';

class MovieDetailsView extends StatefulWidget {
  const MovieDetailsView({super.key, required this.movieId});

  final int movieId;

  @override
  State<MovieDetailsView> createState() => _MovieDetailsViewState();
}

class _MovieDetailsViewState extends State<MovieDetailsView> {
  @override
  void initState() {
    super.initState();
    context.read<MoviesDetailsCubit>().fetchDetails(widget.movieId);
  }

  @override
  void didUpdateWidget(covariant MovieDetailsView oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.movieId != widget.movieId) {
      context.read<MoviesDetailsCubit>().fetchDetails(widget.movieId);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(), body: const MoviesDetailsViewBody());
  }
}
