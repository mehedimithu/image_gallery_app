import 'package:flutter/material.dart';
import 'package:task_app/core/core.dart';
import 'package:task_app/presentation/presentation.dart';

class AppRoutes {
  static const String splashScreenRoute = '/';
  static const String galleryScreenRoute = '/galleryScreen';

  const AppRoutes._();
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splashScreenRoute:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case galleryScreenRoute:
        return MaterialPageRoute(builder: (_) => const GalleryScreen());
      default:
        throw const RouteException('Route not found!');
    }
  }
}
