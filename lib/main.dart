import 'package:dio/dio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/core/utils/api_service.dart';
import 'package:movie/core/utils/app_routes.dart';
import 'package:movie/core/utils/firebase_service.dart';
import 'package:movie/features/home/data/model/repos/home_repo_impl.dart';
import 'package:movie/features/home/presentation/manager/movies_details_cubit/movies_details_cubit.dart';
import 'package:movie/features/home/presentation/manager/popular_movies_cubit/popular_movies_cubit.dart';
import 'package:movie/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  final firebaseService = FirebaseService();
  await firebaseService.initialize();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              PopularMoviesCubit(MovieRepoImpl(apiService: ApiService(Dio())))
                ..fetchMovies(),
        ),
        BlocProvider(
          create: (context) =>
              MoviesDetailsCubit(MovieRepoImpl(apiService: ApiService(Dio()))),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: AppRoutes.route,
        theme: ThemeData.dark(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
