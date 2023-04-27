import 'package:flutter_modular/flutter_modular.dart';

import 'view/page/navigation_screen.dart';

class HomeModule extends Module {
  @override
  List<Bind<Object>> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/',
            child: (_, args) => NavigationScreen(
                  user: args.data,
                )),
      ];
}
