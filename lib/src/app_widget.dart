import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:localization/localization.dart';
import 'package:provider/provider.dart';

import 'feature/auth/repository/user_provider.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LocalJsonLocalization.delegate.directories = ['lib/assets/i18n'];

    return ChangeNotifierProvider(
      create: (_) => UserProvider(),
      child: MaterialApp.router(
        theme: ThemeData(
            fontFamily: 'Tiro Tamil',
            colorScheme: ColorScheme.fromSwatch().copyWith(
              primary: const Color(0xFF0096C7),
              secondary: Colors.orange.shade700,
              tertiary: Colors.white,
              outline: Colors.grey,
            )),
        debugShowCheckedModeBanner: false,
        scrollBehavior: AppScrollBehavior(),
        title: 'app_name'.i18n(),
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          LocalJsonLocalization.delegate
        ],
        supportedLocales: const [
          Locale('pt', 'BR'),
          Locale('en', 'US'),
        ],
        routeInformationParser: Modular.routeInformationParser,
        routerDelegate: Modular.routerDelegate,
      ),
    );
  }
}

class AppScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}
