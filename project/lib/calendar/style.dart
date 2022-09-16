import 'dart:ui';

import 'package:flutter/cupertino.dart' as c;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class Style{
  static final Style styleSingleton = Style._internal();
  Style._internal();
  factory Style() => styleSingleton;

  static TextStyle largeTitle(BuildContext context){
    return TextStyle(
      color: c.CupertinoDynamicColor.resolve(
        c.CupertinoColors.label,
        context,
      ),
      fontWeight: FontWeight.w700,
      fontFamily: 'SFProDisplay',
      fontStyle: FontStyle.normal,
      fontSize: 34.0
    );
  }

  static TextStyle title(BuildContext context){
    return TextStyle(
      color: c.CupertinoDynamicColor.resolve(
        c.CupertinoColors.label,
        context,
      ),
      fontWeight: FontWeight.w600,
      fontFamily: 'SFProDisplay',
      fontStyle: FontStyle.normal,
      fontSize: 28.0,
    );
  }

  static TextStyle title2(BuildContext context){
    return TextStyle(
      color: c.CupertinoDynamicColor.resolve(
          c.CupertinoColors.label,
          context,
      ),
      fontWeight: FontWeight.w400,
      fontFamily: 'SFProText',
      fontStyle: FontStyle.normal,
      fontSize: 17.0,
    );
  }

  static TextStyle body(BuildContext context){
    return TextStyle(
      color: c.CupertinoDynamicColor.resolve(
          c.CupertinoColors.label,
          context,
      ),
      fontWeight: FontWeight.w400,
      fontFamily: 'SFProText',
      fontStyle: FontStyle.normal,
      fontSize: 17.0,
    );
  }

  static TextStyle bodySecondary(BuildContext context){
    return TextStyle(
      color: c.CupertinoDynamicColor.resolve(
        c.CupertinoColors.secondaryLabel,
        context,
      ),
      fontWeight: FontWeight.w400,
      fontFamily: 'SFProText',
      fontStyle: FontStyle.normal,
      fontSize: 17.0,
    );
  }

  static TextStyle footerNoteSecondary(BuildContext context){
    return TextStyle(
      color: c.CupertinoDynamicColor.resolve(
          c.CupertinoColors.secondaryLabel,
          context,
      ),
      fontWeight: FontWeight.w400,
      fontFamily: 'SFProText',
      fontStyle: FontStyle.normal,
      fontSize: 13.0,
    );
  }

  static TextStyle footerNotePrimary(BuildContext context){
    return TextStyle(
      color: c.CupertinoDynamicColor.resolve(
        c.CupertinoColors.label,
        context,
      ),
      fontWeight: FontWeight.w400,
      fontFamily: 'SFProText',
      fontStyle: FontStyle.normal,
      fontSize: 13.0,
    );
  }

  @deprecated
  static TextStyle extraLargeTitle(BuildContext context){
    return TextStyle(
      color: c.CupertinoDynamicColor.resolve(
          c.CupertinoColors.label,
          context,
      ),
      fontWeight: FontWeight.w700,
      fontFamily: 'SFProDisplay',
      fontStyle: FontStyle.normal,
      fontSize: 45.0,
    );
  }

  @deprecated
  static TextStyle subTitle(BuildContext context){
    return TextStyle(
      color: c.CupertinoDynamicColor.resolve(
        c.CupertinoColors.label,
        context,
      ),
      fontWeight: FontWeight.w400,
      fontFamily: 'SFProDisplay',
      fontStyle: FontStyle.normal,
      fontSize: 32.0,
    );
  }

  static TextStyle buttonText(BuildContext context){
    return TextStyle(
      color: c.CupertinoDynamicColor.resolve(
        c.CupertinoColors.white,
        context,
      ),
      fontFamily: 'SFProDisplay',
      fontStyle: FontStyle.normal,
      fontSize: 18.0,
    );
  }
}