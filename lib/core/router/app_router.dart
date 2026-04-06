import 'package:go_router/go_router.dart';
import 'package:liturgia_app/presentation/pages/home_page.dart';
import 'package:liturgia_app/presentation/pages/splash_page.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(path: '/', name: 'splash', builder: (context, state) => const SplashPage()),
    GoRoute(path: '/home', name: 'home', builder: (context, state) => const HomePage())
  ]
);