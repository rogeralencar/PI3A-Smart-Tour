import 'package:flutter/material.dart';

import 'home_screen.dart';
import 'profile_screen.dart';
import 'rating_screen.dart';
import 'interests_screen.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({super.key});

  @override
  NavigationState createState() => NavigationState();
}

class NavigationState extends State<NavigationScreen> {
  late PageController pageViewController;
  int currentPageIndex = 0;

  final List<Widget> _screens = const [
    HomeScreen(),
    InterestsScreen(),
    RatingScreen(),
    ProfileScreen(),
  ];

  @override
  void initState() {
    super.initState();
    pageViewController = PageController();
    pageViewController.addListener(() {
      setState(() {
        currentPageIndex = pageViewController.page?.round() ?? 0;
      });
    });
  }

  @override
  void dispose() {
    pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageViewController,
        children: _screens,
      ),
      bottomNavigationBar: Container(
        height: 60,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: const BorderRadius.vertical(
            top: Radius.circular(20),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              icon: const Icon(Icons.home),
              onPressed: () => pageViewController.animateToPage(
                0,
                duration: const Duration(milliseconds: 500),
                curve: Curves.ease,
              ),
              color: currentPageIndex == 0
                  ? Theme.of(context).colorScheme.secondary
                  : Theme.of(context).colorScheme.tertiary,
            ),
            IconButton(
              icon: const Icon(Icons.edit),
              onPressed: () => pageViewController.animateToPage(
                1,
                duration: const Duration(milliseconds: 500),
                curve: Curves.ease,
              ),
              color: currentPageIndex == 1
                  ? Theme.of(context).colorScheme.secondary
                  : Theme.of(context).colorScheme.tertiary,
            ),
            IconButton(
              icon: const Icon(Icons.star),
              onPressed: () => pageViewController.animateToPage(
                2,
                duration: const Duration(milliseconds: 500),
                curve: Curves.ease,
              ),
              color: currentPageIndex == 2
                  ? Theme.of(context).colorScheme.secondary
                  : Theme.of(context).colorScheme.tertiary,
            ),
            IconButton(
              icon: const Icon(Icons.person),
              onPressed: () => pageViewController.animateToPage(
                3,
                duration: const Duration(milliseconds: 500),
                curve: Curves.ease,
              ),
              color: currentPageIndex == 3
                  ? Theme.of(context).colorScheme.secondary
                  : Theme.of(context).colorScheme.tertiary,
            ),
          ],
        ),
      ),
    );
  }
}
