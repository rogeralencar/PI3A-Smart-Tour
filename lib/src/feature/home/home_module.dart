import 'package:flutter_modular/flutter_modular.dart';

import 'view/page/selected_screen.dart';

class HomeModule extends Module {
  @override
  List<Bind<Object>> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (_, __) => const SelectedScreen()),
      ];
}
