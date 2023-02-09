// Copyright (c) 2022, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:demo_gallery/all_file/all_file.dart';
import 'package:demo_gallery/app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:demo_gallery/app/features/auth/presentation/widget/auth_listener.dart';
import 'package:demo_gallery/app/features/gallery/presentation/bookmark/bloc/user_book_mark_list_bloc.dart';
import 'package:demo_gallery/app/features/gallery/presentation/bookmark/widget/book_mark_listener.dart';
import 'package:demo_gallery/app/widgets/app/dismiss_keyboard.dart';
import 'package:demo_gallery/l10n/l10n.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:overlay_support/overlay_support.dart';

class App extends StatelessWidget {
  const App({super.key});

  AppAutoRoute get appRouter => getIt<AppAutoRoute>();

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle.dark.copyWith(
        systemNavigationBarColor: Theme.of(context).canvasColor,
        systemNavigationBarIconBrightness: Brightness.dark,
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
      child: OverlaySupport.global(
        child: MaterialApp.router(
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: AppLocalizations.supportedLocales,
          title: F.title,
          builder: (context, child) {
            return _flavorBanner(
              child: DismissKeyboard(
                child: MultiBlocProvider(
                  providers: [
                    BlocProvider<AuthBloc>(
                      create: (context) => AuthBloc()..add(AuthFirstLoadUserEvent()),
                    ),
                    BlocProvider<UserBookMarkListBloc>(
                      create: (context) => UserBookMarkListBloc(),
                    ),
                  ],
                  child: BookMarkListener(
                    child: _AppWidget(
                      appRouter: appRouter,
                      child: child ?? Gaps.empty,
                    ),
                  ),
                ),
              ),
            );
          },
          themeMode: ThemeMode.light,
          theme: AppTheme.getTheme(),
          darkTheme: AppTheme.getTheme(isDark: true),
          debugShowCheckedModeBanner: false,
          routerDelegate: appRouter.delegate(
            initialRoutes: [
              const MainRoute(),
            ],
          ),
          routeInformationParser: appRouter.defaultRouteParser(),
        ),
      ),
    );
  }

  Widget _flavorBanner({
    required Widget child,
  }) {
    if (F.appFlavor == Flavor.PRODUCTION) {
      return child;
    }
    return Banner(
      location: BannerLocation.topStart,
      message: F.name,
      color: Colors.green.withOpacity(0.6),
      textStyle: const TextStyle(
        fontWeight: BaseFontWeight.semiBold,
        fontSize: 10.0,
      ),
      child: child,
    );
  }
}

class _AppWidget extends StatefulWidget {
  const _AppWidget({super.key, required this.appRouter, required this.child});

  final AppAutoRoute appRouter;
  final Widget child;

  @override
  State<_AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<_AppWidget> {
  @override
  void initState() {
    super.initState();

    // FirebaseNotificationService.instance.init(
    //   notificationPressedCallBack: _onNotificationClick,
    //   filterMessage: _filterNotification,
    // );
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AuthListener(
      child: ScrollConfiguration(
        behavior: const ScrollBehaviorDefault(),
        child: widget.child,
      ),
    );
  }

}
