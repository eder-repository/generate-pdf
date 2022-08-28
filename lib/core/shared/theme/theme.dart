import 'package:flutter/material.dart';
import 'package:invoice_pdf/core/shared/theme/talma_colors.dart';

abstract class InoviceTheme {
  static ThemeData get theme => light;

  static ThemeData get light => ThemeData(
        scaffoldBackgroundColor: InvoiceColor.backgroundGray,
        backgroundColor: InvoiceColor.white,
        primaryColor: InvoiceColor.primaryBlue,
        primaryColorDark: InvoiceColor.textTitleBlue,
        focusColor: InvoiceColor.primaryBlue,
        errorColor: InvoiceColor.errorRed,
        toggleableActiveColor: InvoiceColor.primaryBlue,
        disabledColor: InvoiceColor.lightGray,
        hintColor: InvoiceColor.gray,
        dividerColor: InvoiceColor.lightGray,
        cardColor: Colors.white,
        shadowColor: InvoiceColor.shadow,
        hoverColor: InvoiceColor.white,
        splashColor: InvoiceColor.shadow,
        highlightColor: Colors.transparent,
        textTheme: textTheme,
        appBarTheme: appBarTheme,
        bottomNavigationBarTheme: bottomNavigationBarThemeData,
        textButtonTheme: textButtonThemeData,
        dividerTheme: dividerThemeData,
        buttonTheme: buttonThemeData,
        colorScheme: colorScheme,
      );

  static ColorScheme get colorScheme {
    return const ColorScheme.light(
      primary: InvoiceColor.primaryBlue,
      secondary: InvoiceColor.accentGreen,
    );
  }

  static ButtonThemeData get buttonThemeData {
    return const ButtonThemeData(
      buttonColor: InvoiceColor.accentGreen,
    );
  }

  static DividerThemeData get dividerThemeData {
    return const DividerThemeData(
      color: InvoiceColor.gray,
      thickness: 1,
    );
  }

  static TextButtonThemeData get textButtonThemeData {
    return TextButtonThemeData(
      style: ButtonStyle(
        padding: MaterialStateProperty.resolveWith((states) {
          return const EdgeInsets.all(4);
        }),
        minimumSize: MaterialStateProperty.resolveWith((states) {
          return const Size(60, 16);
        }),
        foregroundColor: MaterialStateColor.resolveWith((states) {
          return InvoiceColor.accentGreen;
        }),
      ),
    );
  }

  static BottomNavigationBarThemeData get bottomNavigationBarThemeData {
    return const BottomNavigationBarThemeData(
      elevation: 0,
      backgroundColor: InvoiceColor.white,
      selectedItemColor: InvoiceColor.primaryBlue,
      unselectedItemColor: InvoiceColor.lightGray,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      unselectedLabelStyle: TextStyle(
        fontSize: 10,
        fontWeight: FontWeight.w500,
      ),
      selectedLabelStyle: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  static AppBarTheme get appBarTheme {
    return const AppBarTheme(
      toolbarHeight: 56,
      backgroundColor: InvoiceColor.backgroundGray,
      elevation: 0,
      titleTextStyle: TextStyle(
        fontWeight: FontWeight.w700,
        color: InvoiceColor.textTitleBlue,
        fontSize: 14,
      ),
      iconTheme: IconThemeData(color: InvoiceColor.textTitleBlue),
    );
  }

  static TextTheme get textTheme => const TextTheme(
        headline6: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
        headline5: TextStyle(fontSize: 24, fontWeight: FontWeight.w800),
        headline4: TextStyle(fontSize: 28, fontWeight: FontWeight.w800),
        headline3: TextStyle(fontSize: 32, fontWeight: FontWeight.w800),
        headline2: TextStyle(fontSize: 36, fontWeight: FontWeight.w800),
        headline1: TextStyle(fontSize: 40, fontWeight: FontWeight.w800),
        subtitle1: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        subtitle2: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        bodyText1: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
        bodyText2: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
        caption: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
      ).apply(
        displayColor: InvoiceColor.textTitleBlue,
        bodyColor: InvoiceColor.textBodyBlack,
      );
}
