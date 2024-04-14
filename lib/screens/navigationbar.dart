import 'package:dbms_project/constants/colors.dart';
import 'package:dbms_project/constants/constwords.dart';
import 'package:dbms_project/screens/booktickets/booktickets.dart';
import 'package:dbms_project/screens/yourtickets/yourtickects.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class AppNavigationBar extends StatefulWidget {
  const AppNavigationBar({super.key});

  @override
  State<AppNavigationBar> createState() => _AppNavigationBarState();
}

class _AppNavigationBarState extends State<AppNavigationBar> {
  int currentindex = 0;

  List pages = [
    const BookTickets(),
    const YourTickets(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentindex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppColors.primary,
        currentIndex: currentindex,
        selectedItemColor: AppColors.dark,
        unselectedItemColor: AppColors.light,
        onTap: (index) {
          setState(() {
            currentindex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Iconsax.ticket), label: Constants.nav1),
          BottomNavigationBarItem(
              icon: Icon(Iconsax.ticket), label: Constants.nav2),
        ],
      ),
    );
  }
}
