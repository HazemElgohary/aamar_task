import 'package:device_preview/device_preview.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:get/get.dart';

import 'app/config/translate/messages.dart';
import 'app/helpers/keys.dart';
import 'app/helpers/prefs.dart';
import 'app/inject.dart';
import 'app/routes/app_pages.dart';

Future<void> main() async{
  await inject();
  runApp(
    DevicePreview(
      enabled: true,
      builder: (BuildContext context) =>GetMaterialApp(
        title: "Aamar task",
        scrollBehavior: const MaterialScrollBehavior().copyWith(
          dragDevices: {
            PointerDeviceKind.mouse,
            PointerDeviceKind.touch,
          },
        ),
        locale: Locale(Prefs.getString(PrefsKeys.lang).isEmpty
            ? 'en'
            : Prefs.getString(PrefsKeys.lang)),
        initialRoute: AppPages.INITIAL,
        getPages: AppPages.routes,
        debugShowCheckedModeBanner: false,
        useInheritedMediaQuery: true,
        theme: ThemeData.dark(),
        translations: Messages(),
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        fallbackLocale: const Locale('en'),
      ),
    ),
  );
}