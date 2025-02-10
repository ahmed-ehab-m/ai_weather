import 'package:ai_weather/features/auth/presentation/views/logIn_view.dart';
import 'package:ai_weather/features/auth/presentation/views/signUp_view.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static const String login = '/login';
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SignUpView(),
      ),
      GoRoute(
        path: login,
        builder: (context, state) => const LoginView(),
      ),
    ],
  );
}
