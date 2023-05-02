import 'package:flutter/material.dart';
import 'package:localization/localization.dart';

import 'home_screen.dart';
import 'profile_screen.dart';
import 'rating_screen.dart';
import 'interests_screen.dart';
import '../../../auth/repository/user_data.dart';

class NavigationScreen extends StatefulWidget {
  final User user;

  const NavigationScreen({super.key, required this.user});

  @override
  NavigationState createState() => NavigationState();
}

class NavigationState extends State<NavigationScreen> {
  int _selectedIndex = 0;

  late List<Widget> _widgetOptions;

  @override
  void initState() {
    super.initState();
    _widgetOptions = <Widget>[
      HomeScreen(user: widget.user),
      const InterestsScreen(),
      const RatingScreen(),
      const ProfileScreen(),
    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: const Color(0xFF0096C7),
        ),
        child: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(30), topLeft: Radius.circular(30)),
            boxShadow: [
              BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 10),
            ],
          ),
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30.0),
              topRight: Radius.circular(30.0),
            ),
            child: BottomNavigationBar(
              selectedItemColor: Colors.white,
              unselectedItemColor: Colors.white.withOpacity(0.5),
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: const Icon(Icons.home),
                  label: 'home'.i18n(),
                ),
                BottomNavigationBarItem(
                  icon: const Icon(Icons.star),
                  label: 'interests'.i18n(),
                ),
                BottomNavigationBarItem(
                  icon: const Icon(Icons.rate_review),
                  label: 'ratings'.i18n(),
                ),
                BottomNavigationBarItem(
                  icon: const Icon(Icons.person),
                  label: 'profile'.i18n(),
                ),
              ],
              currentIndex: _selectedIndex,
              onTap: _onItemTapped,
            ),
          ),
        ),
      ),
    );
  }
}
