import 'package:event_creator/ui/resources/text_styles_manager.dart';
import 'package:event_creator/ui/resources/values_manager.dart';
import 'package:flutter/material.dart';

class ColorPalette {
  static const Color primary = Colors.amber;
  static const Color secondary = Color(0xFF0B6685);
  static const Color lightPrimary = Color(0xFFE0F1F4);
  static const Color screenBackground = Color(0xFFFFFFFF);
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
  static const Color green = Color(0xFF67C1AA);
  static const Color red = Color(0xFFE42A43);
  static const Color gold = Color(0xFFF9C449);
  static const Color grey = Color(0xFFAFAFAF);
  static const Color darkGrey = Color(0xFF616161);
}

ThemeData getTheme() => ThemeData(
      primaryColor: ColorPalette.primary,
      scaffoldBackgroundColor: ColorPalette.screenBackground,
      appBarTheme: AppBarTheme(
        color: ColorPalette.white,
        foregroundColor: ColorPalette.secondary,
        elevation: Sizes.s4,
        centerTitle: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(Sizes.s16),
            bottomLeft: Radius.circular(Sizes.s16),
          ),
        ),
        titleTextStyle: getBoldTextStyle(
          fontSize: FontSize.s20,
        ),
        actionsIconTheme: const IconThemeData(
          color: ColorPalette.secondary,
          size: Sizes.s28,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        hintStyle: getLightTextStyle(fontSize: FontSize.s16),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: ColorPalette.grey, width: Sizes.s2),
          borderRadius: BorderRadius.all(Radius.circular(Sizes.s8)),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: ColorPalette.grey, width: Sizes.s2),
          borderRadius: BorderRadius.all(Radius.circular(Sizes.s8)),
        ),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: ColorPalette.red, width: Sizes.s2),
          borderRadius: BorderRadius.all(Radius.circular(Sizes.s8)),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: ColorPalette.red, width: Sizes.s2),
          borderRadius: BorderRadius.all(Radius.circular(Sizes.s8)),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          textStyle: getBoldTextStyle(
            color: ColorPalette.white,
            fontSize: FontSize.s18,
          ),
          backgroundColor: ColorPalette.primary,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(Sizes.s8)),
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          textStyle: getBoldTextStyle(
            fontSize: FontSize.s18,
          ),
          foregroundColor: ColorPalette.primary,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(Sizes.s8)),
          ),
          side: const BorderSide(color: ColorPalette.primary, width: Sizes.s2),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          textStyle: getMediumTextStyle(
            fontSize: FontSize.s14,
          ),
          foregroundColor: ColorPalette.primary,
        ),
      ),
      dividerTheme: const DividerThemeData(
        color: ColorPalette.grey,
        thickness: Sizes.s_8,
      ),
      tabBarTheme: const TabBarTheme(
        labelColor: ColorPalette.secondary,
        unselectedLabelColor: ColorPalette.secondary,
      ),
      listTileTheme: const ListTileThemeData(iconColor: ColorPalette.primary),
      switchTheme: SwitchThemeData(
        thumbColor: const MaterialStatePropertyAll(ColorPalette.primary),
        trackColor:
            MaterialStatePropertyAll(ColorPalette.primary.withOpacity(0.5)),
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: ColorPalette.primary,
      ),
      radioTheme: const RadioThemeData(
        fillColor: MaterialStatePropertyAll(ColorPalette.primary),
      ),
      textTheme: TextTheme(
        displaySmall: getRegularTextStyle(fontSize: FontSize.s36),
        headlineLarge: getRegularTextStyle(fontSize: FontSize.s32),
        headlineSmall: getRegularTextStyle(fontSize: FontSize.s24),
        titleLarge: getMediumTextStyle(fontSize: FontSize.s22),
        titleMedium: getMediumTextStyle(fontSize: FontSize.s16),
        bodyMedium: getRegularTextStyle(fontSize: FontSize.s14),
      ),
    );
