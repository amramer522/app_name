import 'package:app_name/screens/home/view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/Kiwi.dart';
import 'core/bloc_observer.dart';
import 'core/cache_helper.dart';
import 'core/styles/colors.dart';
import 'core/styles/themes.dart';
import 'core/un_focus.dart';
import 'generated/codegen_loader.g.dart';
import 'screens/editor/view.dart';
import 'screens/splash/view.dart';

final GlobalKey<NavigatorState> navigator = GlobalKey<NavigatorState>();

void printMyDetails({required name,required age, height, weight}) {
  print(
      "hello $name your age is $age year and your height is $height  s ${(weight ==
          null) || (weight == 0) ? "" : " and your weight is $weight kg"}");
}

void main() async {
  printMyDetails(age: 25,name: "amr");





  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  await CacheHelper.init();
  // await GlobalNotification().setUpFirebase();
  await EasyLocalization.ensureInitialized();

  initKiwi();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then((_) {
    BlocOverrides.runZoned(
          () {
        runApp(
          EasyLocalization(
            path: 'assets/translations',
            startLocale: const Locale('en'),
            fallbackLocale: const Locale('ar'),
            saveLocale: true,
            supportedLocales: const [Locale('ar'), Locale('en')],
            assetLoader: const CodegenLoader(),
            child: ScreenUtilInit(
              designSize: const Size(390, 844),
              child: const MyApp(),
              builder: (c, child) => child!,
            ),
          ),
        );
      },
      blocObserver: MyBlocObserver(),
    );
  });
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.white,
    ));

    return MaterialApp(
      title: 'App Name',
      navigatorKey: navigator,
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      theme: AppThemes.light(),
      builder: (context, child) =>
          UnFocus(
            child: MediaQuery(
              data: MediaQuery.of(context).copyWith(textScaleFactor: .85),
              child: child!,
            ),
          ),
      themeMode: ThemeMode.light,
      home: EditorScreen(),
    );
  }
}


