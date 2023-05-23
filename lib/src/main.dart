import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'app_widget.dart';
import 'feature/onboarding/onboarding_module.dart';

void main() {
  runApp(
    ModularApp(
      module: OnBoardingModule(),
      child: const AppWidget(),
    ),
  );
}
