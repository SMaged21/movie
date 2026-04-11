import 'package:dio/dio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:movie/core/utils/api_service.dart';
import 'package:movie/core/utils/app_routes.dart';
import 'package:movie/core/utils/deep_links.dart';
import 'package:movie/core/utils/firebase_service.dart';
import 'package:movie/features/home/data/model/repos/home_repo_impl.dart';
import 'package:movie/features/home/presentation/manager/movies_details_cubit/movies_details_cubit.dart';
import 'package:movie/features/home/presentation/manager/popular_movies_cubit/popular_movies_cubit.dart';
import 'package:movie/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  final firebaseService = FirebaseService();
  final deepLinks = DeepLinks();
  final initialRoute = await deepLinks.getInitialRoute();
  await firebaseService.initialize();

  runApp(MyApp(deepLinks: deepLinks, initialRoute: initialRoute));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key, required this.deepLinks, this.initialRoute});

  final DeepLinks deepLinks;
  final String? initialRoute;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late final GoRouter _router;

  @override
  void initState() {
    super.initState();
    _router = AppRoutes.createRouter(initialLocation: widget.initialRoute);
    widget.deepLinks.startListening(_router);
  }

  @override
  void dispose() {
    widget.deepLinks.dispose();
    _router.dispose();
    super.dispose();
  }

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
        routerConfig: _router,
        theme: ThemeData.dark(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
