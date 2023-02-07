import 'package:demo_gallery/all_file/all_file.dart';
import 'package:demo_gallery/app/features/home/core/routes/home_routes.dart';
import 'package:demo_gallery/app/features/main/presentation/main_page.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page|Dialog,Route',
  routes: <AutoRoute>[
    AutoRoute(
      path: '/main',
      page: MainPage,
      children: [
        ...homeRoutes,
      ],
    ),
  ],
)
class $AppAutoRoute {}
