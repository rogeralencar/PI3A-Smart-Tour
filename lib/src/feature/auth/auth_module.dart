import 'package:flutter_modular/flutter_modular.dart';

import 'view/page/forgot_password_screen.dart';
import 'view/page/form_screen.dart';
import 'view/page/signup_screen.dart';
import 'view/page/login_screen.dart';
import '../home/home_module.dart';

class AuthModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (_, __) => const LoginScreen(),
        ),
        ChildRoute(
          '/forgotPassword',
          child: (_, __) => const ForgotPasswordScreen(),
          transition: TransitionType.fadeIn,
        ),
        ChildRoute(
          '/signup/',
          child: (_, __) => const SignupScreen(),
          transition: TransitionType.fadeIn,
        ),
        ChildRoute(
          '/signup/form',
          child: (_, args) => FormScreen(user: args.data),
          transition: TransitionType.fadeIn,
        ),
        ModuleRoute('/home', module: HomeModule()),
      ];
}
