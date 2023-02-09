// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:flutter/material.dart' as _i6;

import '../features/auth/presentation/login_page/login_page.dart' as _i2;
import '../features/gallery/presentation/bookmark_viewer/bookmark_viewer_page.dart'
    as _i4;
import '../features/gallery/presentation/gallery_page/gallery_page.dart' as _i3;
import '../features/main/presentation/main_page.dart' as _i1;

class AppAutoRoute extends _i5.RootStackRouter {
  AppAutoRoute([_i6.GlobalKey<_i6.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    MainRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.MainPage(),
      );
    },
    LoginRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.LoginPage(),
      );
    },
    GalleryRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.GalleryPage(),
      );
    },
    BookmarkViewerRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i4.BookmarkViewerPage(),
      );
    },
  };

  @override
  List<_i5.RouteConfig> get routes => [
        _i5.RouteConfig(
          MainRoute.name,
          path: '/main',
          children: [
            _i5.RouteConfig(
              GalleryRoute.name,
              path: 'gallery',
              parent: MainRoute.name,
            ),
            _i5.RouteConfig(
              BookmarkViewerRoute.name,
              path: 'bookmark-viewer',
              parent: MainRoute.name,
            ),
          ],
        ),
        _i5.RouteConfig(
          LoginRoute.name,
          path: 'login',
        ),
      ];
}

/// generated route for
/// [_i1.MainPage]
class MainRoute extends _i5.PageRouteInfo<void> {
  const MainRoute({List<_i5.PageRouteInfo>? children})
      : super(
          MainRoute.name,
          path: '/main',
          initialChildren: children,
        );

  static const String name = 'MainRoute';
}

/// generated route for
/// [_i2.LoginPage]
class LoginRoute extends _i5.PageRouteInfo<void> {
  const LoginRoute()
      : super(
          LoginRoute.name,
          path: 'login',
        );

  static const String name = 'LoginRoute';
}

/// generated route for
/// [_i3.GalleryPage]
class GalleryRoute extends _i5.PageRouteInfo<void> {
  const GalleryRoute()
      : super(
          GalleryRoute.name,
          path: 'gallery',
        );

  static const String name = 'GalleryRoute';
}

/// generated route for
/// [_i4.BookmarkViewerPage]
class BookmarkViewerRoute extends _i5.PageRouteInfo<void> {
  const BookmarkViewerRoute()
      : super(
          BookmarkViewerRoute.name,
          path: 'bookmark-viewer',
        );

  static const String name = 'BookmarkViewerRoute';
}
