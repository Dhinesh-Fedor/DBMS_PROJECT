import 'package:dbms_project/screens/navigationbar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
    bottomNavigationBar: AppNavigationBar(),
    );
  }
}