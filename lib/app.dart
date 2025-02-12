import 'package:flutter/material.dart';
import 'package:flutter_sosmed/core/app_route/routes.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRoute.router,
    );
  }
}
