import 'package:e_shope/utilities/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

var textStyle = GoogleFonts.openSans(
  fontSize: 17,
  fontWeight: FontWeight.normal,
  color: darkColor,
);

var secondaryTextStyle =
    GoogleFonts.lato(fontSize: 14, fontWeight: FontWeight.normal);

var textStyleLight = textStyle.apply(
  fontWeightDelta: -2,
);
