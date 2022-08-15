import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

gFontsSans({
  double sz = 70,
  double ls = 5,
  FontWeight fw = FontWeight.normal,
  Color clr = Colors.green,
}) {
  return GoogleFonts.firaSansCondensed(
    fontSize: sz,
    letterSpacing: ls,
    fontWeight: fw,
    foreground: Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10
      ..color = clr,
  );
}

gFontsLato({FontWeight fw = FontWeight.bold,Color clr=Colors.black}) {
  return GoogleFonts.lato(
    fontSize: 20,
    fontWeight: fw,
    color: clr
  );
}
