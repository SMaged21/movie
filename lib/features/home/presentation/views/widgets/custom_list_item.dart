import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie/core/utils/app_routes.dart';
import 'package:movie/features/home/data/model/movie_model/movie_model.dart';

class CustomListItem extends StatelessWidget {
  final MovieModel movie;

  const CustomListItem({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    double height = MediaQuery.sizeOf(context).height;

    return MaterialButton(
      onPressed: () {
        GoRouter.of(context).push(AppRoutes.movieDetailsPath(movie.id!));
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
