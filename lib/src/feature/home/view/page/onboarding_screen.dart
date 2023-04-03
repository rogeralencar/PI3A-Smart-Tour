import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'onboarding_details.dart';
import 'form_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int _currentPage = 0;
  final PageController _pageController = PageController(initialPage: 0);
  final List<Widget> _pages = [
    OnboardingDetails(
        title: 'Bem-vindo ao SmartTour',
        subtitle: 'Um app para deixar suas férias ainda melhores!',
        image: Image.asset('lib/assets/images/onboarding1.png')),
    OnboardingDetails(
        title: 'Começe agora!',
        subtitle:
            'Leva apenas alguns minutos, será feito um questionário para que a gente possa te conhecer melhor',
        image: Image.asset('lib/assets/images/onboarding2.jpeg')),
    OnboardingDetails(
        title: 'Tenha um app adaptado para você!',
        subtitle:
            'Criei seu perfil para sempre nos adaptarmos a suas mudanças. Esperamos que você ame nosso app!',
        image: Image.asset('lib/assets/images/onboarding3.png')),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 162, 241, 255),
              Color.fromARGB(255, 20, 84, 109),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: _pages.length,
                itemBuilder: (BuildContext context, int index) {
                  return _pages[index % _pages.length];
                },
                onPageChanged: (int page) {
                  setState(() {
                    _currentPage = page;
                  });
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      if (_currentPage > 0) {
                        _pageController.previousPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut);
                      }
                    },
                    child: const Text(
                      'Back',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  _currentPage != 2
                      ? TextButton(
                          onPressed: () {
                            FormScreen();
                          },
                          child: const Text(
                            'Skip',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        )
                      : const Text(''),
                  ElevatedButton(
                    onPressed: () {
                      if (_currentPage < _pages.length - 1) {
                        _pageController.nextPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut);
                      } else {
                        FormScreen();
                      }
                    },
                    child: Text(
                      _currentPage == _pages.length - 1 ? 'Done' : 'Next',
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
