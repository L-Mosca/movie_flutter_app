import 'package:flutter/material.dart';
import 'package:movie_flutter_app/base/providers/localization_provider.dart';
import 'package:movie_flutter_app/base/providers/theme_provider.dart';
import 'package:movie_flutter_app/localization/delegate/app_localization_delegate.dart';
import 'package:movie_flutter_app/localization/strings/en_us/en_us.dart';
import 'package:movie_flutter_app/localization/strings/pt_br/pt_br.dart';
import 'package:movie_flutter_app/presentation/theme/app_themes.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:movie_flutter_app/router/app_router.dart';

import '../base/providers/color_token_provider.dart';
import '../presentation/theme/colors/color_tokens.dart'
    show DarkColorToken, LightColorToken;

class App extends StatefulWidget {
  const App({super.key, required this.isDarkMode, required this.locale});

  final bool isDarkMode;
  final Locale locale;

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  ThemeMode? _themeMode;
  Locale? _locale;

  void _setLocale(Locale locale) => {setState(() => _locale = locale)};

  void _setTheme(ThemeMode theme) => {setState(() => _themeMode = theme)};

  @override
  void initState() {
    _locale = widget.locale;
    _themeMode = widget.isDarkMode ? ThemeMode.dark : ThemeMode.light;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LocalizationProvider(
      locale: _locale,
      setLocale: _setLocale,
      child: ThemeProvider(
        themeMode: _themeMode,
        setThemeMode: _setTheme,
        child: MaterialApp(
          themeMode: _themeMode,
          locale: _locale,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          localizationsDelegates: _localizationsDelegates,
          supportedLocales: _supportedLocales,
          debugShowCheckedModeBanner: false,
          debugShowMaterialGrid: false,
          initialRoute: AppRouter.splashRoute,
          onGenerateRoute: _routes,
          builder: (context, child) {
            final brightness = Theme.of(context).brightness;
            final colorToken =
                brightness == Brightness.dark
                    ? DarkColorToken()
                    : LightColorToken();

            return ColorTokenProvider(colorToken: colorToken, child: child!);
          },
        ),
      ),
    );
  }

  Iterable<Locale> get _supportedLocales => const [
    Locale("pt", "BR"),
    Locale("en", "US"),
  ];

  Iterable<LocalizationsDelegate<dynamic>>? get _localizationsDelegates => [
    AppLocalizationDelegate(ptBrLocalization: PtBr(), enUsLocalization: EnUs()),
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
  ];

  Route<dynamic>? _routes(RouteSettings settings) {
    return AppRouter.onGenerateRoute(settings, context);
  }
}
