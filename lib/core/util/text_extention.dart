import 'package:flutter/material.dart';

const FontWeight lightWeight = FontWeight.w300;
const FontWeight regularWeight = FontWeight.w400;
const FontWeight mediumWeight = FontWeight.w500;
const FontWeight semiBoldWeight = FontWeight.w600;
const FontWeight boldWeight = FontWeight.w700;

extension TextStyleHelpers on TextStyle {
  TextStyle weight(FontWeight w) => copyWith(fontWeight: w);

  TextStyle size(double s) => copyWith(fontSize: s);

  TextStyle colors(Color c) => copyWith(color: c);
}
