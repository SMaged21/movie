import 'package:flutter/material.dart';
import 'package:movie/features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:movie/features/home/presentation/views/widgets/custom_movie_list_builder.dart';

class MoviesViewBody extends StatelessWidget {
  const MoviesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomAppBar(),
          Text("Popular Movies", style: TextStyle(fontSize: 32)),
          CustomMovieListBuilder(),
          SizedBox(height: 300),
        ],
      ),
    );
  }
}
