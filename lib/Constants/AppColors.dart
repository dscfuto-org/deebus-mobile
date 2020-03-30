import 'package:flutter/material.dart';

Map<int, Color> color = {
  50: Color.fromRGBO(136, 14, 79, .1),
  100: Color.fromRGBO(136, 14, 79, .2),
  200: Color.fromRGBO(136, 14, 79, .3),
  300: Color.fromRGBO(136, 14, 79, .4),
  400: Color.fromRGBO(136, 14, 79, .5),
  500: Color.fromRGBO(136, 14, 79, .6),
  600: Color.fromRGBO(136, 14, 79, .7),
  700: Color.fromRGBO(136, 14, 79, .8),
  800: Color.fromRGBO(136, 14, 79, .9),
  900: Color.fromRGBO(136, 14, 79, 1),
};

class AppColors {
  AppColors(); // Default Constructor
  AppColors._(); // this basically makes it so you can instantiate this class

  static const _deeBusPrimaryPrivate = 0xff6372c1;
  static const _deeBusPrimaryDarkPrivate = 0xff304790;
  static const _deeBusAccentPrivate = 0xffe61700;

  static final Color color1 = Color(0xffffffff);
  static final Color color2 = Color(0xff2d98f0);
  static final Color color5 = Colors.black;
  static const Color color4 = Color(_deeBusPrimaryPrivate);
  static final MaterialColor color3 = MaterialColor(0xffffffff, color);

  static const MaterialColor deeBusPrimary = const MaterialColor(
    _deeBusPrimaryPrivate,
    const <int, Color>{
      50: const Color(0xFFb6bde2),
      100: const Color(0xFFa4addb),
      200: const Color(0xFF929dd3),
      300: const Color(0xFF7f8ccc),
      400: const Color(0xFF6d7cc5),
      500: const Color(_deeBusPrimaryPrivate),
      600: const Color(0xFF5b6bbe),
      700: const Color(0xFF495bb6),
      800: const Color(0xFF4152a4),
      900: const Color(0xFF3a4992),
    },
  );

  static const MaterialColor deeBusPrimaryDark = const MaterialColor(
    _deeBusPrimaryDarkPrivate,
    const <int, Color>{
      50: const Color(0xFF667ecc),
      100: const Color(0xFF536ec6),
      200: const Color(0xFF405ebf),
      300: const Color(0xFF3954ac),
      400: const Color(0xFF334b99),
      500: const Color(_deeBusPrimaryDarkPrivate),
      600: const Color(0xFF2d4186),
      700: const Color(0xFF263873),
      800: const Color(0xFF202f60),
      900: const Color(0xFF19254d),
    },
  );

  static const MaterialColor deeBusAccent = const MaterialColor(
    _deeBusAccentPrivate,
    const <int, Color>{
      50: const Color(0xFFff7566),
      100: const Color(0xFFff5e4d),
      200: const Color(0xFFff4733),
      300: const Color(0xFFff301a),
      400: const Color(0xFFff1a00),
      500: const Color(_deeBusAccentPrivate),
      600: const Color(0xFFcc1400),
      700: const Color(0xFFb31200),
      800: const Color(0xFF990f00),
      900: const Color(0xFF800d00),
    },
  );

  Color hexToColor(String hex) {
    return new Color(int.parse(hex.substring(1, 7), radix: 16) + 0xFF000000);
  }
}
