import 'package:flutter/material.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            const ListTile(title: Text('Kitchen Operations'), dense: true),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.dashboard),
              title: const Text('Dashboard'),
            ),
            ListTile(
              leading: const Icon(Icons.shopping_cart),
              title: const Text('Take Orders'),
            ),
            ListTile(
              leading: const Icon(Icons.restaurant),
              title: const Text('Prepare Order'),
            ),
            ListTile(
              leading: const Icon(Icons.kitchen),
              title: const Text('Kitchen Operation'),
            ),
          ],
        ),
      ),
    );
  }
}
