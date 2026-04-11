import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/features/home/presentation/manager/movies_details_cubit/movies_details_cubit.dart';

class MoviesDetailsViewBody extends StatelessWidget {
  const MoviesDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return BlocBuilder<MoviesDetailsCubit, MoviesDetailsState>(
      builder: (context, state) {
        if (state is MoviesDetailsLoading || state is MoviesDetailsInitial) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is MoviesDetailsFailure) {
          return Center(child: Text(state.errMessage));
        }

        if (state is! MoviesDetailsSuccess) {
          return const Center(child: Text("No movie details available"));
        }

        final movie = state.movie;

        return SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Column(
                  children: [
                    Image.network(
                      "https://image.tmdb.org/t/p/w500${movie.posterPath}",
                      width: width * 0.6,
                      height: height * 0.4,
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      movie.title ?? "Unknown Title",
                      style: const TextStyle(fontSize: 24),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Text(
                "Rating: ${movie.voteAverage}",
                style: const TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 10),
              Text(
                movie.overview ?? "No description available",
                style: const TextStyle(fontSize: 16),
              ),
            ],
          ),
        );
      },
    );
  }
}
