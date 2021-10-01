import 'package:flutter/material.dart';

class LineContainer extends StatelessWidget {
  const LineContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      height: 1,
      width: double.infinity,
      decoration: const BoxDecoration(color: Color(0xFF484848)),
    );
  }
}
