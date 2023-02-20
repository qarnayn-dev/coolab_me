import 'package:flutter/material.dart';

class AppTheme {
  static const int _primaryHex = 0xFFFFD4B2;
  // static const Color primary = Color(_primaryHex);

  static const MaterialColor primary = MaterialColor(
    _primaryHex,
    <int, Color>{
      50: Color(0xffffead9),
      100: Color(0xffffe5d1),
      200: Color(0xffffe1c9),
      300: Color(0xffffddc1),
      400: Color(0xffffd8ba),
      500: Color(_primaryHex),
      600: Color(0xffe6bfa0),
      700: Color(0xffccaa8e),
      800: Color(0xffb3947d),
      900: Color(0xff997f6b),
    },
  );

  static const Color primaryS2 = Color(0xFFF3B27F);
  static const Color primaryS3 = Color(0xFFEB914B);
  static const Color secondary = Color(0xFFFFF6BD);
  static const Color accent = Color(0xFFCEEDC7);
  static const Color accent2 = Color(0xFF86C8BC);
  static const Color nBlack = Color(0xFF242424);
  static const Color nGrey = Color(0xFFA0A0A0);
  static const Color nWhite = Color(0xFFEAEAEA);

  static const Color semanticError = Color.fromRGBO(170, 44, 44, 1);
  static const Color semanticWarning = Color(0xFFFFc800);
  static const Color semanticSuccess = Color(0xFF06d6a0);
  static const Color semanticInfo = Color(0xFF5fbff9);

  static const Map<int, Color> labelColor = {
    1: Color(0xFF39B5E0),
    2: Color(0xFF59CE8F),
    3: Color(0xFFEB455F),
    4: Color(0xFF7D1E6A),
    5: Color(0xFF24A19C),
    6: Color(0xFF8E0505),
    7: Color(0xFF292C6D),
    8: Color(0xFF1C7947),
    9: Color(0xFFEE5007),
    10: Color(0xFFFFC947),
  };

  static final ThemeData themeData = ThemeData(
    primaryColor: primary,
    // colorSchemeSeed: primary,
    backgroundColor: nWhite,
    primaryColorLight: primary,
    primaryColorDark: primary[700],
    cardColor: Colors.white,
    canvasColor: (_brightness == Brightness.light) ? Colors.white : nBlack,
    dialogBackgroundColor: Colors.black45,
    appBarTheme: const AppBarTheme(titleTextStyle: headerStyle),
    dividerColor: nGrey,
    errorColor: semanticError,
    checkboxTheme: checkboxTheme,
    focusColor: secondary,
    // fontFamily: 'Roboto',
    hintColor: Colors.grey[400],
    iconTheme: const IconThemeData(color: nBlack, opacity: 0.8),
    floatingActionButtonTheme: floatingActionButtonTheme,
    highlightColor: primary[100],
    // hoverColor: primaryWTint, // leave as a comment or the appbar icon will be reflected.
    // indicatorColor: primaryWTint,
    inputDecorationTheme: inputDecorationTheme,
    elevatedButtonTheme: elevatedButtonTheme,
    listTileTheme: listTileTheme,
    textTheme: textTheme,
    progressIndicatorTheme: ProgressIndicatorThemeData(color: primary[400]),
    splashColor: primary[100],
    switchTheme: switchTheme,
    timePickerTheme: timePickerTheme,
    colorScheme: colorScheme,
    dividerTheme: dividerTheme,
    dialogTheme: dialogTheme,
    pageTransitionsTheme: pageTransitionsTheme,
  );

  static const TextStyle headerStyle = TextStyle(color: nBlack, fontSize: 20, fontWeight: FontWeight.normal);
  static const TextStyle headerStyleMedium = TextStyle(color: nBlack, fontSize: 20, fontWeight: FontWeight.w500);
  static const TextStyle headerStyleLG = TextStyle(color: nBlack, fontSize: 24, fontWeight: FontWeight.normal);

  static const TextStyle subtitleStyle = TextStyle(color: nBlack, fontSize: 16, fontWeight: FontWeight.normal);
  static const TextStyle subtitleStyleMedium = TextStyle(color: nBlack, fontSize: 16, fontWeight: FontWeight.w500);
  static const TextStyle subtitleStyleLight = TextStyle(color: nBlack, fontSize: 16, fontWeight: FontWeight.w300);
  static const TextStyle subtitleStyleSMMedium = TextStyle(color: nBlack, fontSize: 14, fontWeight: FontWeight.w500);

  static const TextStyle bodyStyle = TextStyle(color: nBlack, fontSize: 14, fontWeight: FontWeight.normal);
  static const TextStyle bodyStyleLG = TextStyle(color: nBlack, fontSize: 16, fontWeight: FontWeight.normal);

  static const TextStyle secondaryStyle = TextStyle(color: nGrey, fontSize: 14, fontWeight: FontWeight.normal);

  static const TextStyle captionStyle = TextStyle(color: nGrey, fontSize: 12, fontWeight: FontWeight.normal);
  static const TextStyle captionStyleLight = TextStyle(color: nGrey, fontSize: 12, fontWeight: FontWeight.w300);
  static const TextStyle captionStyleSM = TextStyle(color: nGrey, fontSize: 10, fontWeight: FontWeight.normal);

  static const TextTheme textTheme = TextTheme(
    bodyText2: bodyStyle, // use for normal text
    caption: secondaryStyle, // Use in the ListTile subtitle
    headline1: headerStyleMedium,
    headline2: subtitleStyleMedium,
    subtitle1: subtitleStyle, // use in the listTile's title & the textfield
    subtitle2: subtitleStyleLight,
  );

  static const Brightness _brightness = Brightness.light;

  static final ColorScheme colorScheme = ColorScheme(
    brightness: _brightness,
    primary: primary,
    onPrimary: nWhite,
    secondary: secondary,
    onSecondary: nWhite,
    error: semanticError,
    onError: nWhite,
    background: Colors.white,
    onBackground: nBlack,
    surface: primary[100]!,
    onSurface: nBlack,
    outline: primary,
  );

  static final MaterialStateProperty<Color?> _primaryAsSelected = MaterialStateProperty.resolveWith<Color?>((states) {
    return (states.contains(MaterialState.selected) ||
            states.contains(MaterialState.focused) ||
            states.contains(MaterialState.pressed))
        ? primary
        : null;
  });

  static final MaterialStateProperty<Color?> _primaryWhiteAsSelected =
      MaterialStateProperty.resolveWith<Color?>((states) {
    return (states.contains(MaterialState.selected) ||
            states.contains(MaterialState.focused) ||
            states.contains(MaterialState.pressed))
        ? primary[100]
        : null;
  });

  static const ListTileThemeData listTileTheme = ListTileThemeData(
    contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
  );

  static final CheckboxThemeData checkboxTheme = CheckboxThemeData(
    fillColor: _primaryAsSelected,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
  );

  static final SwitchThemeData switchTheme = SwitchThemeData(
    thumbColor: _primaryAsSelected,
    trackColor: _primaryWhiteAsSelected,
  );

  static final FloatingActionButtonThemeData floatingActionButtonTheme = FloatingActionButtonThemeData(
    backgroundColor: Colors.white,
    splashColor: primary[200],
  );

  static final InputDecorationTheme inputDecorationTheme = InputDecorationTheme(
    contentPadding: const EdgeInsets.symmetric(horizontal: 6),
    hintStyle: const TextStyle(fontSize: 15),
    border: OutlineInputBorder(
      borderSide: BorderSide(width: 1.6, color: primary[400]!),
      borderRadius: BorderRadius.circular(8),
    ),
  );

  static final ElevatedButtonThemeData elevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      primary: primary,
      textStyle: bodyStyle.copyWith(letterSpacing: 1.6, fontWeight: FontWeight.w500),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
    ),
  );

  static const TimePickerThemeData timePickerTheme = TimePickerThemeData(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.0))),
  );

  static const DividerThemeData dividerTheme = DividerThemeData(
    color: Color.fromARGB(255, 189, 189, 189),
    thickness: 0.6,
  );

  static final DialogTheme dialogTheme = DialogTheme(
    backgroundColor: nWhite,
    alignment: Alignment.center,
    titleTextStyle: headerStyle,
    contentTextStyle: bodyStyle.copyWith(fontSize: 14),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
  );

  static const PageTransitionsTheme pageTransitionsTheme = PageTransitionsTheme(builders: {
    // TargetPlatform.macOS: CustomFadeTransitionBuilder(),
    // TargetPlatform.windows: CustomFadeTransitionBuilder(),
  });
}
