import 'package:flutter/material.dart';
import 'package:movie/features/home/presentation/views/widgets/movies_view_body.dart';

class MoviesView extends StatelessWidget {
  const MoviesView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(body: MoviesViewBody()));
  }
}
