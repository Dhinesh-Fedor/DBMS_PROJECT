import 'package:dbms_project/constants/colors.dart';
import 'package:dbms_project/constants/constwords.dart';
import 'package:flutter/material.dart';

class YourTickets extends StatefulWidget {
  const YourTickets({super.key});

  @override
  State<YourTickets> createState() => _YourTicketsState();
}

class _YourTicketsState extends State<YourTickets> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      title: Text(
        Constants.nav2,
        style: Theme.of(context).textTheme.headlineMedium,
      ),
      centerTitle: true,
      backgroundColor: AppColors.primary,
    ));
  }
}
