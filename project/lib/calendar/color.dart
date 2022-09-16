import 'package:flutter/cupertino.dart' as c;

enum healthColor{
  systemBlack,
  systemRed,
  systemYellow,
  systemGreen,
  systemWhite,
}

c.CupertinoDynamicColor getColor(healthColor color){
  switch(color){
    case healthColor.systemGreen:
      return c.CupertinoColors.systemGreen;
    case healthColor.systemYellow:
      return c.CupertinoColors.systemYellow;
    case healthColor.systemRed:
      return c.CupertinoColors.systemRed;
    default:
      return c.CupertinoColors.systemGrey5;
  }
}