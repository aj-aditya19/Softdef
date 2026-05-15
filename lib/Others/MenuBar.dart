import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Menubar extends StatefulWidget {
  final Function(int) onMenuSelected;

  const Menubar({super.key, required this.onMenuSelected});

  @override
  State<Menubar> createState() => _MenubarState();
}

class _MenubarState extends State<Menubar> {
  final List<String> menuItems = [
    "Schedule",
    "Live Orders",
    "Shelf Left Items",
    "Preprepared",
    "Available",
    "Required",
  ];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: List.generate(menuItems.length, (index) {
            final isSelected = selectedIndex == index;

            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex = index;
                });

                widget.onMenuSelected(index);
              },

              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 6),
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                decoration: BoxDecoration(
                  color: isSelected
                      ? const Color.fromARGB(255, 0, 0, 0)
                      : Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  menuItems[index],
                  style: GoogleFonts.outfit(
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                    color: isSelected ? Colors.white : Colors.black,
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
