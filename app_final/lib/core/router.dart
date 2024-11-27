import 'package:app_final/screens/home_screen.dart';
import 'package:app_final/screens/login_screen.dart';
import 'package:app_final/screens/details_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:app_final/screens/register_screen.dart';

final appRouter = GoRouter(initialLocation: '/login', routes: [
  GoRoute(
    name: LoginScreen.name,
    path: '/login',
    builder: (context, state) => const LoginScreen(),
  ),
  GoRoute(
    name: RegisterScreen.name,
    path: '/register',
    builder: (context, state) => const RegisterScreen(),
  ),
  GoRoute(
    name: HomeScreen.name,
    path: '/home',
    builder: (context, state) => const HomeScreen(),
  ),
  GoRoute(
    name: DetailScreen.name,
    path: '/detalles',
    builder: (context, state) => DetailScreen(),
  ),
]);
