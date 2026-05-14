import 'package:flutter/material.dart';
import 'package:test_ui/Others/MenuBar.dart';
import 'package:test_ui/Screen/Available.dart';
import 'package:test_ui/Screen/LiveOrders.dart';
import 'package:test_ui/Screen/Prepared.dart';
import 'package:test_ui/Screen/Required.dart';
import 'package:test_ui/Screen/Schedule.dart';
import 'package:test_ui/Screen/ShelfLifeItems.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  int selectedIndex = 0;

  final List<Widget> screens = [
    Schedule(),
    Liveorders(),
    Shelflifeitems(),
    Prepared(),
    Available(),
    Required(),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Menubar(
          onMenuSelected: (index) {
            setState(() {
              selectedIndex = index;
            });
          },
        ),

        Expanded(child: screens[selectedIndex]),
      ],
    );
  }
}
