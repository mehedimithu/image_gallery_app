import 'package:flutter/material.dart';
import 'package:task_app/controller/controller.dart';
import 'package:task_app/core/core.dart';
import 'package:task_app/presentation/presentation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRoutes {
  static const String splashScreenRoute = '/';
  static const String galleryScreenRoute = '/galleryScreen';
  static const String imageInfoScreenRoute = '/imageInfoScreen';

  const AppRoutes._();
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splashScreenRoute:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case galleryScreenRoute:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (BuildContext context) =>
                ListOfImageCubit(ListOfImageRepo(ImageService())),
            child: const GalleryScreen(),
          ),
        );
      case imageInfoScreenRoute:
        final arguments = settings.arguments as ScreenArguments;
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (BuildContext context) =>
                ImageInfoCubit(InfoImageService()),
            child: ImageInfoScreen(
              id: arguments.id,
              downloadUrl: arguments.downloadUrl,
            ),
          ),
        );

      default:
        throw const RouteException('Route not found!');
    }
  }
}
