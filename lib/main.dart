import 'package:flutter/material.dart';
import 'package:metallo/core/routing/app_router.dart';
import 'package:metallo/core/routing/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Metallo',
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      initialRoute: AppRoutes.homeScreen,
      onGenerateRoute: AppRouter().generateRoute,
    );
  }
}

