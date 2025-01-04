import 'package:flutter/material.dart';

class PhinexaColor {
  static const Color logoColor = Color(0xFF0174FA);
  static const Color primaryColor = Color(0xFF3993A1);
  static const Color secondaryColor = Color(0xFF479BFE);
  static const Color accentColor = Color(0xFF7BB3FB);

  static const Color white = Colors.white;
  static const Color lightWhite = Color(0x77FFFFFF);
  static const Color lighterWhite = Color(0x44FFFFFF);
  static const Color black = Colors.black;
  static const Color lightBlack = Colors.black87;
  static const Color lighterBlack = Colors.black45;
  static const Color lightestBlack = Colors.black26;
  static const Color grey = Color(0xFFB3B3B3);
  static const Color lightGrey = Color(0xFFDCDCDF);
  static const Color lighterGrey = Color(0xFFF7F7F7);
  static const Color darkGrey = Color(0xFF625f6a);
  static const Color darkBlue = Color(0xFF2D525D);
  static const Color darkGreen = Color(0xFF57B07B);
  static const Color lightGreen = Color(0xFFDAF1E0);
  static const Color red = Color(0xFFFF5C5C);
  static const Color certficateBg = Color(0xFFF1FAFA);

  static const Color titleTextColor = Colors.black;
  static const Color subTitleTextColor = Colors.black54;
  static Color bgColor = const Color(0xFFF9F9F9);
  static Color shadowGrey = const Color(0x333E404D);
  static Color shadowGreyDark = const Color(0x463E404D);
  // static Color shadowColor = PhinexaColor.primaryColor.withOpacity(0.4);

  static Color errorColor = const Color(0xffdc3535);
  static Color textColor = Colors.black;
  static Color neutral700 = const Color(0xff4d4d4d);
  static Color neutral800 = const Color(0xff333333);
  static Color neutral400 = const Color(0xff999999);
  static Color neutral300 = const Color(0xffb3b3b3);
  static Color neutral200 = const Color(0xffcccccc);
  static Color neutral100 = const Color(0xffe5e5e5);
  static Color shadowColor = const Color(0xff000000).withOpacity(0.01);
  static Color transparent = Colors.transparent;
  static Color primaryBlue = const Color(0xff007afc);
  static Color primaryPurple = const Color(0xFF7C40FF);
  static Color primary300 = const Color(0xffC8E6C9);
  static Color primary200 = const Color(0xffE4F3E5);
  static Color primary100 = const Color(0xffEDF7EE);

  static List<Color> lightGradient = [PhinexaColor.white, PhinexaColor.white];
  static List<Color> darkGradient = [
    PhinexaColor.black.withOpacity(0.6),
    PhinexaColor.black.withOpacity(0.3)
  ];
  static List<Color> primaryColorGradient = [
    PhinexaColor.primaryColor.withOpacity(0.8),
    PhinexaColor.primaryColor.withOpacity(0.4)
  ];
  static List<Color> borderGradient = [
    PhinexaColor.white.withOpacity(0.1),
    PhinexaColor.white.withOpacity(0.5),
    PhinexaColor.white.withOpacity(0.1),
  ];
  static List<Color> transparentGradient = [
    PhinexaColor.white.withOpacity(0),
    PhinexaColor.white.withOpacity(0),
  ];

  // data package gradients
  static final List<List<Color>> _dataPackageGradients = [
    [
      const Color(0xFF407BFF),
      const Color(0xFF3972F3).withOpacity(0.74),
    ],
    [
      const Color(0xFF7C40FF),
      const Color(0xFF7C40FF).withOpacity(0.74),
    ],
    [
      const Color(0xFF52A868),
      const Color(0xFF52A868).withOpacity(0.74),
    ],
    [
      const Color(0xFF1E5D95),
      const Color(0xFF1E5D95).withOpacity(0.74),
    ]
    // Add more gradient lists as needed
  ];

  // voice package gradients
  static final List<List<Color>> _addOnGradients = [
    [
      const Color(0xFF7D40FF),
      const Color(0xFFE3ABF1).withOpacity(0.74),
    ],
    [
      const Color(0xFFAC40FF),
      const Color(0xFFE6CBED).withOpacity(0.74),
    ],
    [
      const Color(0xFF1B2ABA),
      const Color(0xFFABB4F1).withOpacity(0.74),
    ],
    [
      const Color(0xFFFF40D2),
      const Color(0xFFF3CAFC).withOpacity(0.74),
    ],
    // Add more gradient lists as needed
  ];

}

