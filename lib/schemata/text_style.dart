import 'package:flutter/material.dart';

extension TextStyleExtensions on TextStyle {
  // Weights
  TextStyle get bold => weight(FontWeight.w600);

  // Styles
  TextStyle get medium20 => customStyle(
        fontSize: 20,
        letterSpacing: 0.0,
        weight: FontWeight.w500,
      );
  TextStyle get medium16 => customStyle(
        fontSize: 16,
        letterSpacing: 0.0,
        weight: FontWeight.w500,
      );
  TextStyle get medium14 => customStyle(
        fontSize: 16,
        letterSpacing: 0.0,
        weight: FontWeight.w500,
      );
  TextStyle get medium18 => customStyle(
        fontSize: 18,
        letterSpacing: 0.0,
        weight: FontWeight.w500,
      );
  TextStyle get semiBold32 => customStyle(
        fontSize: 32,
        letterSpacing: 0.0,
        weight: FontWeight.w600,
      );
  TextStyle get semiBold24 => customStyle(
        fontSize: 24,
        letterSpacing: 0.0,
        weight: FontWeight.w600,
      );
  TextStyle get semiBold14 => customStyle(
        fontSize: 14,
        letterSpacing: 0.0,
        weight: FontWeight.w600,
      );
  TextStyle get semiBold16 => customStyle(
        fontSize: 16,
        letterSpacing: 0.0,
        weight: FontWeight.w600,
      );
  TextStyle get semiBold18 => customStyle(
        fontSize: 18,
        letterSpacing: 0.0,
        weight: FontWeight.w600,
      );
  TextStyle get semiBold20 => customStyle(
        fontSize: 20,
        letterSpacing: 0.0,
        weight: FontWeight.w600,
      );
  TextStyle get semiBold12 => customStyle(
        fontSize: 12,
        letterSpacing: 0.0,
        weight: FontWeight.w600,
      );
  TextStyle get semiBold13 => customStyle(
        fontSize: 13,
        letterSpacing: 0.0,
        weight: FontWeight.w600,
      );
  TextStyle get semiBold48 => customStyle(
        fontSize: 48,
        letterSpacing: 0.0,
        weight: FontWeight.w700,
      );
  TextStyle get normal18 => customStyle(
        fontSize: 18,
        letterSpacing: 0.0,
        weight: FontWeight.w400,
      );
  TextStyle get normal14 => customStyle(
        fontSize: 14,
        letterSpacing: 0.0,
        weight: FontWeight.w400,
      );
  TextStyle get normal16 => customStyle(
        fontSize: 16,
        letterSpacing: 0.0,
        weight: FontWeight.w400,
      );
  TextStyle get normal12 => customStyle(
        fontSize: 12,
        letterSpacing: 0.0,
        weight: FontWeight.w400,
      );
  TextStyle get normal10 => customStyle(
        fontSize: 10,
        letterSpacing: 0.0,
        weight: FontWeight.w400,
      );
  TextStyle get normal13 => customStyle(
        fontSize: 13,
        letterSpacing: 0.0,
        weight: FontWeight.w400,
      );

  /// Shortcut for color
  TextStyle textColor(Color v) => copyWith(color: v);

  /// Shortcut for fontWeight
  TextStyle weight(FontWeight v) => copyWith(fontWeight: v);

  /// Shortcut for fontSize
  TextStyle size(double v) => copyWith(fontSize: v);

  /// Shortcut for letterSpacing
  TextStyle letterSpace(double v) => copyWith(letterSpacing: v);

  TextStyle customStyle({
    required double letterSpacing,
    required double fontSize,
    required FontWeight weight,
  }) =>
      copyWith(
        fontFamily: "Poppins",
        letterSpacing: letterSpacing,
        fontSize: fontSize,
        fontWeight: weight,
      );
}
