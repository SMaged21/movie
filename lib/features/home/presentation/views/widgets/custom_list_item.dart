import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:movie/core/utils/app_routes.dart';
import 'package:movie/features/home/data/model/movie_model/movie_model.dart';
import 'package:movie/features/home/presentation/manager/movies_details_cubit/movies_details_cubit.dart';

class CustomListItem extends StatelessWidget {
  final MovieModel movie;

  const CustomListItem({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    double height = MediaQuery.sizeOf(context).height;

    return MaterialButton(
      onPressed: () {
        context.read<MoviesDetailsCubit>().fetchDetails(movie.id!);
        GoRouter.of(context).push(AppRoutes.moviesDetailsView);
      },
      child: Column(
        children: [
          Image.network(
            "https://image.tmdb.org/t/p/w500${movie.posterPath}",
            width: width * 0.5,
            height: height * 0.3,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 8),
          Text(movie.title.toString(), style: const TextStyle(fontSize: 20)),
        ],
      ),
    );
  }
}
