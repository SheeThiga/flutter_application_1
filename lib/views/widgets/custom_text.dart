import 'package:flutter/material.dart';
import 'package:flutter_application_1/configs/constants.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomText extends StatelessWidget {
  final String label;
  final Color labelColor;
  final dynamic fontSize;
  final FontWeight fontWeight;
  const CustomText({
    super.key,
    required this.label,
    this.labelColor = appWhiteColor,
    this.fontSize = 16.0,
    this.fontWeight = FontWeight.bold,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: GoogleFonts.cormorant(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: labelColor,
      ),
    );
  }
}
