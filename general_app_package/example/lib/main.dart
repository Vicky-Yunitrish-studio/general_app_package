import 'package:example/main_page.dart';
import 'package:flutter/material.dart';
import 'package:general_app_package/component/general_material_app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return generalMaterialApp(
      title: 'App',
      home: const MainPage(),
    );
  }
}
