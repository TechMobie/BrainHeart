import 'dart:io';
import 'package:brain_heart/app/routes/app_pages.dart';
import 'package:brain_heart/schemata/color_schema.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:brain_heart/helper/utils/math_utils.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle.dark.copyWith(
        statusBarBrightness: Brightness.dark, // this one for iOS
        statusBarIconBrightness: Brightness.light,
        statusBarColor: Colors.transparent),
  );

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      navigatorKey: key,
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.initial,

      // home: BottomBar(),
      theme: ThemeData(
        primaryColor: ColorSchema.primaryColor,
        fontFamily: "Poppins",
      ),
      themeMode: ThemeMode.light,
      defaultTransition: Transition.topLevel,
      getPages: AppPages.pages,
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
