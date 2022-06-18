import 'package:amazon_clone_v3/core/constants/app/app_constants.dart';
import 'package:amazon_clone_v3/core/constants/color/color_constants.dart';
import 'package:amazon_clone_v3/core/init/translations/language_manager.dart';
import 'package:amazon_clone_v3/product/widget/bottombar/bottom_bar.dart';
import 'package:amazon_clone_v3/providers/user_providers.dart';
import 'package:amazon_clone_v3/router.dart';
import 'package:amazon_clone_v3/view/authenticate/service/auth_service.dart';
import 'package:amazon_clone_v3/view/authenticate/view/auth_view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  await _init();
  runApp(
    EasyLocalization(
      supportedLocales: LanguageManager.instance.supportedLocales,
      path: ApplicationConstants.TRANSLATIONS_ASSET_PATH,
      startLocale: LanguageManager.instance.enLocale,
      fallbackLocale: LanguageManager.instance.enLocale,
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => UserProvider(),
          ),
        ],
        child: const MyApp(),
      ),
    ),
  );
}

Future<void> _init() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AuthService authService = AuthService();

  @override
  void initState() {
    super.initState();
    authService.getUserData(context);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates, // localization
      supportedLocales: context.supportedLocales, // localization
      locale: context.locale, // localization
      title: ApplicationConstants.APP_NAME,

      theme: ThemeData(
          scaffoldBackgroundColor: ColorVariables.backgroundColor,
          colorScheme: const ColorScheme.light(
            primary: ColorVariables.secondaryColor,
          ),
          appBarTheme: const AppBarTheme(elevation: 0, iconTheme: IconThemeData(color: ColorVariables.iconColor))),
      onGenerateRoute: (settings) => generateRoute(settings),

      home: Provider.of<UserProvider>(context).user.token.isNotEmpty ? const BottomBar() : const AuthView(),
    );
  }
}
