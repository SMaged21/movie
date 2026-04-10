import 'package:flutter/material.dart';
import 'package:movie/features/home/data/model/movie_model/movie_model.dart';
import 'package:movie/features/home/presentation/views/widgets/custom_list_item.dart';

class CustomMovieList extends StatelessWidget {
  final List<MovieModel> movies;
  const CustomMovieList({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: movies.length,
      itemBuilder: (context, i) {
        return CustomListItem(movie: movies[i]);
      },
    );
  }
}
