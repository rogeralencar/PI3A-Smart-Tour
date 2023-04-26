import 'package:flutter_modular/flutter_modular.dart';

import 'form_module.dart';
import '../page/signup_screen.dart';
import '../../../home/home_module.dart';

class SignupModule extends Module {
  @override
  List<Bind<Object>> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (_, __) => const SignupScreen()),
        ModuleRoute('/form/', module: FormModule()),
        ModuleRoute('/home/', module: HomeModule()),
      ];
}
