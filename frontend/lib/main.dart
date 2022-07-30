import 'package:flutter/material.dart';
import 'package:frontend/core/routes/routes.dart';
import 'package:frontend/features/login/screens/login_screen.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData(color: Colors.black),
        ),
        unselectedWidgetColor: Colors.orange,
      ),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: (RouteSettings routeSettings) =>
          Routes.onGenerateRoute(routeSettings),
      home: const LoginScreen(),
    );
  }
}
