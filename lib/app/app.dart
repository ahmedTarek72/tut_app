import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:tut_app/presentation/resources/routes_manager.dart';
import 'package:tut_app/presentation/resources/theme_manager.dart';

class MyApp extends StatefulWidget {
  // private constructor
  const MyApp._internal();

  static MyApp? _instance; // Make _instance nullable

  static MyApp get instance {
    _instance ??= const MyApp._internal(); // Initialize if null
    return _instance!;
  }

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
     
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      theme: getAppTheme(),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: RouteGenerator.getRoute,
      initialRoute: Routes.splashRoute,
    );
  }
}
