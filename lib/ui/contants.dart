import 'package:flutter/material.dart';

class Colorss {
  static Color get mainYellow => Color.fromARGB(255, 255, 230, 0);
  static Color get secondaryYellow => const Color.fromARGB(255, 231, 214, 64);
}

class Layout {
  // TODO Remove unused
  static const double xsmall = 4;
  static const double small = 8;
  static const double medium = 16;
  static const double large = 24;
  static const double mlarge = 32;
  static const double xlarge = 48;
  static const double xxlarge = 96;
  static const double xxxlarge = 192;
}

class Spacing {
  static Widget get spacingH4 => const SizedBox(width: Layout.xsmall);
  static Widget get spacingH8 => const SizedBox(width: Layout.small);
  static Widget get spacingH16 => const SizedBox(width: Layout.medium);

  static Widget get spacingV4 => const SizedBox(height: Layout.xsmall);
  static Widget get spacingV8 => const SizedBox(height: Layout.small);
  static Widget get spacingV16 => const SizedBox(height: Layout.medium);
}

class Typographies {
  static const TextStyle h0 =
      TextStyle(fontSize: 24, fontWeight: FontWeight.bold);
  static const TextStyle h1 =
      TextStyle(fontSize: 16, fontWeight: FontWeight.bold);
  static const TextStyle b0 =
      TextStyle(fontSize: 14, fontWeight: FontWeight.bold);
}
