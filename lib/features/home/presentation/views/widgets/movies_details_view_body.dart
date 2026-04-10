import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/features/home/presentation/manager/movies_details_cubit/movies_details_cubit.dart';

class MoviesDetailsViewBody extends StatelessWidget {
  const MoviesDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      child: MovieDetaisBuilder(width: width, height: height),
    );
  }
}

class MovieDetaisBuilder extends StatelessWidget {
  const MovieDetaisBuilder({
    super.key,
    required this.width,
    required this.height,
  });

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesDetailsCubit, MoviesDetailsState>(
      builder: (context, state) {
        if (state is MoviesDetailsSuccess) {
          final movie = state.movie; // 🔥 IMPORTANT

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Column(
                  children: [
                    Image.network(
                      "https://image.tmdb.org/t/p/w500${movie.posterPath}",
                      width: width * 0.6,
                      height: height * .4,
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      movie.title ?? "Unknown Title",
                      style: const TextStyle(fontSize: 24),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 16),

              // ⭐ Rating
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  "⭐ ${movie.voteAverage}",
                  style: const TextStyle(fontSize: 18),
                ),
              ),

              const SizedBox(height: 10),

              // 📄 Description
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  movie.overview ?? "No description available",
                  style: const TextStyle(fontSize: 16),
                ),
              ),
            ],
          );
        } else if (state is MoviesDetailsFailure) {
          return const Center(child: Text("Oops, something went wrong"));
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
