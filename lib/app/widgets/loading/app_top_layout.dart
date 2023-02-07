import 'package:demo_gallery/all_file/all_file.dart';
import 'package:flutter/cupertino.dart';

enum AppTopLayoutLoadingType {
  defaultLoading,
  iosLoading,
}

class AppTopLayout extends _BaseAppTopLayout {
  const AppTopLayout({
    Key? key,
    required Widget topWidget,
    required Widget bottomWidget,
    bool showTopWidget = false,
    bool ignoreChild = true,
  }) : super(
    key: key,
    topWidget: topWidget,
    bottomWidget: bottomWidget,
    showTopWidget: showTopWidget,
    ignoreChild: ignoreChild,
  );

  factory AppTopLayout.loadingOnTop({
    required Widget child,
    bool isLoading = false,
    bool ignoreChild = true,
    AppTopLayoutLoadingType loadingType =
        AppTopLayoutLoadingType.defaultLoading,
  }) {
    Widget loadingWidget = Container(
      color: const Color.fromRGBO(68, 68, 68, 0.3),
      child: const Center(
        child: CupertinoActivityIndicator(radius: 16.0),
      ),
    );
    if (loadingType == AppTopLayoutLoadingType.iosLoading) {
      loadingWidget = AppLoading.defaultLoadingCenter();
    }

    return AppTopLayout(
      topWidget: loadingWidget,
      bottomWidget: child,
      showTopWidget: isLoading,
      ignoreChild: ignoreChild,
    );
  }
}

class _BaseAppTopLayout extends StatelessWidget {
  final Widget topWidget;
  final Widget bottomWidget;
  final bool showTopWidget;
  final bool ignoreChild;

  const _BaseAppTopLayout({
    Key? key,
    required this.topWidget,
    required this.bottomWidget,
    this.showTopWidget = false, 
    this.ignoreChild = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IgnorePointer(
          ignoring: ignoreChild && showTopWidget,
          child: bottomWidget,
        ),
        if (showTopWidget)
          Positioned.fill(
            child: topWidget,
          ),
      ],
    );
  }
}
