import 'package:flutter/material.dart';
import 'package:modularbmi/home_screen.dart';

class ReusableCard extends StatelessWidget {
  const ReusableCard({super.key, required this.icon, required this.text});
  final IconData icon;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          size: 80,
          color: Colors.white,
        ),
        Text(
          text,
          style: kTextStyle1,
        )
      ],
    );
  }
}
