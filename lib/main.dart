import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:get/get.dart';
import 'package:nutri_criuse/app/routes/app_pages.dart';
import 'package:nutri_criuse/presentation/pages/home_screen.dart';

void main() {
  runApp(
    // DevicePreview(builder: (context) =>
    const MyApp(),
    // enabled: !kReleaseMode)
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(primarySwatch: Colors.green),
      title: 'Nutri Cruise',
      debugShowCheckedModeBanner: false,
      //! Tells GetX which screen to
      //! show when app starts
      initialRoute: AppPages.INITIAL,
      //! Provides all Available routes to GetX
      getPages: AppPages.routes,
      //! Device Preview Specific settings
      //! (To test on different screen sizes)
      // useInheritedMediaQuery: true,
      // builder: DevicePreview.appBuilder,
    );
  }
}
