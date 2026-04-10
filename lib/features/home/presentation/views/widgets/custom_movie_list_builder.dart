import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/features/home/presentation/manager/popular_movies_cubit/popular_movies_cubit.dart';
import 'package:movie/features/home/presentation/views/widgets/custom_movie_list.dart';

class CustomMovieListBuilder extends StatelessWidget {
  const CustomMovieListBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PopularMoviesCubit, PopularMoviesState>(
      builder: (context, state) {
        if (state is PopularMoviesSuccess) {
          return Expanded(child: CustomMovieList(movies: state.movies));
        } else if (state is PopularMoviesFailure) {
          return Text("oops");
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }
}
