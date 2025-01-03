import 'package:bloc_cubit_test/app_router.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(BreakingBadApp(appRouter: AppRouter()));
}

class BreakingBadApp extends StatelessWidget {
  const BreakingBadApp({super.key, required this.appRouter});

  final AppRouter appRouter;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: appRouter.generaterouter,
    );
  }
}
