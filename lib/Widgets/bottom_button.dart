import 'package:flutter/material.dart';

class BottomButton extends StatelessWidget {
  const BottomButton(
      {super.key, required this.onTap, required this.bottomText});
  final VoidCallback onTap;
  final Text bottomText;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: Color(0xFFEB1555), borderRadius: BorderRadius.circular(10)),
        child: Center(child: bottomText),
        padding: EdgeInsets.only(bottom: 10),
        margin: EdgeInsets.only(top: 10),
        width: double.infinity,
        height: MediaQuery.of(context).size.height * .10,
      ),
    );
  }
}
