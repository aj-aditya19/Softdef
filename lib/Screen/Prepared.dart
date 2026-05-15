import 'package:flutter/material.dart';

class Prepared extends StatefulWidget {
  const Prepared({super.key});

  @override
  State<Prepared> createState() => _PreparedState();
}

class _PreparedState extends State<Prepared> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          'This is the Prepared Screen',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
