import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

textStyleWithPoppins(
    {required Color color,
    required double fontsize,
    required FontWeight fontweight}) {
  return GoogleFonts.poppins(
    color: color,
    fontSize: fontsize,
    fontWeight: fontweight,
  );
}
