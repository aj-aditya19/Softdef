import 'package:flutter/material.dart';

class Navbar extends StatefulWidget {
  const Navbar({super.key});

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  int selectedIndex = 0;

  final List<Map<String, dynamic>> navItems = [
    {"title": "Dashboard", "icon": Icons.dashboard},

    {"title": "Take Orders", "icon": Icons.shopping_cart},

    {"title": "Prepare Order", "icon": Icons.restaurant},

    {"title": "Kitchen Operation", "icon": Icons.kitchen},
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      // width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 10),

      decoration: BoxDecoration(
        color: Colors.white,

        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 5, offset: Offset(0, 2)),
        ],
      ),

      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: List.generate(navItems.length, (index) {
            final isSelected = selectedIndex == index;

            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex = index;
                });
              },

              child: Container(
                margin: const EdgeInsets.only(right: 16),

                padding: const EdgeInsets.symmetric(
                  horizontal: 18,
                  vertical: 10,
                ),

                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),

                child: Column(
                  children: [
                    Icon(
                      navItems[index]['icon'],
                      color: isSelected
                          ? const Color.fromARGB(255, 111, 111, 111)
                          : Colors.black87,
                    ),

                    const SizedBox(width: 8),
                    Text(
                      navItems[index]["title"],

                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,

                        color: isSelected
                            ? const Color.fromARGB(255, 111, 111, 111)
                            : Colors.black87,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
