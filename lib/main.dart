import 'package:dashhit/common/style/app_style.dart';
import 'package:dashhit/presentation/dashboard/dashboard_screen.dart';
import 'package:dashhit/provider/data_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => DataProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'HitDash',
      theme: ThemeData(
        cardColor: AppStyle.surface,
        scaffoldBackgroundColor: AppStyle.backgroundLight,
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const DashboardScreen(),
    );
  }
}
