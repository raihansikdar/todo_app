import 'dart:ui';

import 'package:flutter/material.dart';

class TextComponent extends StatelessWidget {
  const TextComponent({
    super.key,
    required this.text,
    required this.maxLines,
    required this.textAlign,
    required this.overflow,
    this.strutStyle,
    this.textDirection,
    this.softWrap,
    this.locale,
    this.textScaler,
    this.semanticsLabel,
    this.textWidthBasis,
    this.textHeightBehavior,
    this.selectionColor,
    required this.color,
    this.backgroundColor,
    required this.fontSize,
    required this.fontWeight,
    this.fontStyle,
    this.letterSpacing = 0.6,
    this.wordSpacing,
    this.textBaseline,
    this.height,
    this.leadingDistribution,
    this.foreground,
    this.background,
    this.shadows,
    this.fontFeatures,
    this.fontVariations,
    this.decoration,
    this.decorationColor,
    this.decorationStyle,
    this.decorationThickness,
    this.debugLabel,
    this.fontFamily,
    this.fontFamilyFallback,
    this.package,
  });

  final String text;
  final int maxLines;
  final TextAlign textAlign;
  final TextOverflow overflow;
  final StrutStyle? strutStyle;
  final TextDirection? textDirection;
  final bool? softWrap;
  final Locale? locale;
  final TextScaler? textScaler;
  final String? semanticsLabel;
  final TextWidthBasis? textWidthBasis;
  final TextHeightBehavior? textHeightBehavior;
  final Color? selectionColor;
  final Color color;
  final Color? backgroundColor;
  final double fontSize;
  final FontWeight fontWeight;
  final FontStyle? fontStyle;
  final double letterSpacing;
  final double? wordSpacing;
  final TextBaseline? textBaseline;
  final double? height;
  final TextLeadingDistribution? leadingDistribution;
  final Paint? foreground;
  final Paint? background;
  final List<Shadow>? shadows;
  final List<FontFeature>? fontFeatures;
  final List<FontVariation>? fontVariations;
  final TextDecoration? decoration;
  final Color? decorationColor;
  final TextDecorationStyle? decorationStyle;
  final double? decorationThickness;
  final String? debugLabel;
  final String? fontFamily;
  final List<String>? fontFamilyFallback;
  final String? package;




  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLines,
      textAlign: textAlign,
      overflow: overflow,
      strutStyle: strutStyle,
      textDirection: textDirection,
      softWrap: softWrap,
      locale: locale,
      textScaler: textScaler,
      semanticsLabel: semanticsLabel,
      textWidthBasis: textWidthBasis,
      textHeightBehavior: textHeightBehavior,
      selectionColor: selectionColor,

      style: TextStyle(
        color: color,
        backgroundColor: backgroundColor,
        fontSize: fontSize,
        fontWeight : fontWeight,
        fontStyle: fontStyle,
        letterSpacing: letterSpacing,
        wordSpacing: wordSpacing,
        textBaseline: textBaseline,
        height: height,
        leadingDistribution: leadingDistribution,
        foreground: foreground,
        background: background,
        shadows: shadows,
        fontFeatures: fontFeatures,
        fontVariations: fontVariations,
        decoration: decoration,
        decorationColor: decorationColor,
        decorationStyle: decorationStyle,
        decorationThickness: decorationThickness,
        debugLabel: debugLabel,
        fontFamily: fontFamily,
        fontFamilyFallback: fontFamilyFallback,
        package: package,
      ),
    );
  }
}