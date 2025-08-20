import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:get/get.dart';
import 'package:nutri_criuse/app/controllers/app_controller.dart';
import 'package:nutri_criuse/app/routes/app_pages.dart';

void main() {
  Get.put(AppController());
  runApp(
    DevicePreview(builder: (context) => const MyApp(), enabled: !kReleaseMode),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 0, 150, 5),
        ),
        useMaterial3: true,
        appBarTheme: AppBarTheme(
          backgroundColor: const Color.fromARGB(255, 87, 169, 194),
          foregroundColor: Colors.white,
          elevation: 40,
          shadowColor: Colors.black,
          toolbarHeight: 80,
        ),
      ),
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
