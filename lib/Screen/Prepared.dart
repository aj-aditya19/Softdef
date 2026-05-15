import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Prepared extends StatefulWidget {
  const Prepared({super.key});

  @override
  State<Prepared> createState() => _PreparedState();
}

class _PreparedState extends State<Prepared> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'This is the Prepared Screen',
        style: GoogleFonts.outfit(fontSize: 14, fontWeight: FontWeight.w500),
      ),
    );
  }
}
