import 'package:flutter/material.dart';
import 'package:movie/features/home/presentation/views/widgets/movies_details_view_body.dart';

class MovieDetailsView extends StatelessWidget {
  const MovieDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(), body: MoviesDetailsViewBody());
  }
}
