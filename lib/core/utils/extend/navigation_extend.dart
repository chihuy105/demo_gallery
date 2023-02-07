import 'package:demo_gallery/all_file/all_file.dart';

extension BuildContextRootExtend on BuildContext {
  // BuildContext get rootContext => getIt<AppAutoRoute>().rootContext ?? this;
}

extension AutoRouteExtend on StackRouter {
  bool popToParentOf(List<String> routeNameList,
      {VoidCallback? onNotFound, bool reverse = false}) {
    var stackList = stack;
    if (reverse) {
      stackList = stack.reversed.toList();
    }

    final index = stackList.indexWhere((item) =>
        routeNameList
            .find((itemRouteName) => item.routeData.name == itemRouteName) !=
        null);

    final parentRoute = stackList.getOrNull(index - 1);
    final name = parentRoute?.routeData.name;

    if (!name.isNullOrEmpty()) {
      popUntilRouteWithName(name!);
      return true;
    }

    if (onNotFound != null) {
      onNotFound();
      return false;
    }
    return false;
  }

  bool popToOf(List<String> routeNameList,
      {VoidCallback? onNotFound, bool reverse = false}) {
    var stackList = stack;

    if (reverse) {
      stackList = stack.reversed.toList();
    }
    final index = stackList.indexWhere((item) =>
        routeNameList
            .find((itemRouteName) => item.routeData.name == itemRouteName) !=
        null);

    final route = stackList.getOrNull(index);
    final name = route?.routeData.name;

    logger.i(name);

    if (!name.isNullOrEmpty()) {
      popUntilRouteWithName(
        name!,
      );
      return true;
    }

    if (onNotFound != null) {
      onNotFound();
      return false;
    }
    return false;
  }
}
