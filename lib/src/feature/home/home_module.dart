import 'package:flutter_modular/flutter_modular.dart';

import 'view/page/navigation_screen.dart';
import 'view/page/travel_details_screen.dart';
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
          '/interestSelection',
          child: (_, __) => const InterestsSelectionScreen(),
          transition: TransitionType.fadeIn,
        ),
        ChildRoute(
          '/travelDetail',
          child: (_, args) => TravelDetailsScreen(
            currentUserId: args.data['userId'],
            travel: args.data['travel'],
          ),
          transition: TransitionType.fadeIn,
        ),
      ];
}
