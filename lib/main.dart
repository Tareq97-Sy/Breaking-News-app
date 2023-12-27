import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tareq_khashaneh/core/routes.dart';
import 'package:tareq_khashaneh/view/pages/article_details.dart';
import 'package:tareq_khashaneh/view/pages/splash_page.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.splashRoute,
      getPages: [
        GetPage(name: AppRoutes.articleDetailsRoute, page: () => ArticleDetailsPage()),
        GetPage(name: AppRoutes.splashRoute, page: () => const SplashPage()),
      ],
    );
  }
}
