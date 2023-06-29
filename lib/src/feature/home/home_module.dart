import 'package:flutter_modular/flutter_modular.dart';

import 'view/page/navigation_screen.dart';
import 'view/widget/interests_selection_screen.dart';

class HomeModule extends Module {
  @override
  List<Bind<Object>> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (_, __) => const NavigationScreen(),
          transition: TransitionType.fadeIn,
        ),
        ChildRoute(
          '/interestsSelection',
          child: (_, __) => const InterestsSelectionScreen(),
          transition: TransitionType.fadeIn,
        ),
      ];
}
