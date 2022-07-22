import 'package:flutter/material.dart';

class AhlColors {
  static const Color primary = Color(0xFF0E2241);
  static const Color primary80 = Color(0xFF273F63);
  static const Color primary60 = Color(0xFF54709C);
  static const Color primary40 = Color(0xFFBBC9DF);
  static const Color primary20 = Color(0xFFECF1FA);
  static const Color primary10 = Color(0xFFF6F9FD);

  static const Color primaryA20 = Color(0x330E2241);

  static const Color accent = Color(0xFFFB1F56);

  static const Color yellow = Color(0xFFFDD548);
  static const Color orange = Color(0xFFFFAC7D);
  static const Color red = Color(0xFFFC9385);
  static const Color pink = Color(0xFFFA9CBE);
  static const Color violet = Color(0xFFD7A5F5);
  static const Color purple = Color(0xFFAEA8F0);
  static const Color blue = Color(0xFF9AB4F5);
  static const Color azure = Color(0xFF8DD2F9);
  static const Color cyan = Color(0xFF84F0EA);
  static const Color mint = Color(0xFF7EF0B3);
  static const Color green = Color(0xFFA7EA72);
  static const Color lime = Color(0xFFDFED3C);

  static const Color darkYellow = Color(0xFF5E4F19);
  static const Color darkOrange = Color(0xFF542D17);
  static const Color darkRed = Color(0xFF60231B);
  static const Color darkPink = Color(0xFF5B1B32);
  static const Color darkViolet = Color(0xFF461A61);
  static const Color darkPurple = Color(0xFF1D175C);
  static const Color darkBlue = Color(0xFF182B5A);
  static const Color darkAzure = Color(0xFF173C51);
  static const Color darkCyan = Color(0xFF185450);
  static const Color darkMint = Color(0xFF1D623D);
  static const Color darkGreen = Color(0xFF396218);
  static const Color darkLime = Color(0xFF565B1A);

  static Color toDark(Color normalColor) => normalColor == yellow
      ? darkYellow
      : normalColor == orange
          ? darkOrange
          : normalColor == red
              ? darkRed
              : normalColor == pink
                  ? darkPink
                  : normalColor == violet
                      ? darkViolet
                      : normalColor == purple
                          ? darkPurple
                          : normalColor == blue
                              ? darkBlue
                              : normalColor == azure
                                  ? darkAzure
                                  : normalColor == cyan
                                      ? darkCyan
                                      : normalColor == mint
                                          ? darkMint
                                          : normalColor == green
                                              ? darkGreen
                                              : normalColor == lime
                                                  ? darkLime
                                                  : primary;
}
