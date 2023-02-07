import 'package:demo_gallery/all_file/all_file.dart';
import 'package:flutter/cupertino.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      routes: const [
        HomeRoute(),
        HomeRoute(),
      ],
      bottomNavigationBuilder: (_, tabsRouter) {
        return _HomeBottomBar(
          tabsRouter: tabsRouter,
        );
      },
    );
  }
}

class _HomeBottomBar extends StatelessWidget {
  const _HomeBottomBar({
    super.key,
    required this.tabsRouter,
    this.iconSize = Dimens.ic,
  });

  final TabsRouter tabsRouter;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    return CupertinoTabBar(
      currentIndex: tabsRouter.activeIndex,
      onTap: tabsRouter.setActiveIndex,
      inactiveColor: const Color(0xFF717171),
      height: kToolbarHeight,
      items: [
        _buildBottomBarItem(
          context: context,
          icon: Icons.home_filled,
          label: 'home'.tr,
        ),
        _buildBottomBarItem(
          context: context,
          icon: Icons.favorite,
          label: 'news'.tr,
        ),
      ],
    );
  }

  BottomNavigationBarItem _buildBottomBarItem({
    required BuildContext context,
    required String label,
    dynamic icon,
    dynamic activeIcon,
  }) {
    final iconW = _getIconWidget(context, icon);
    final activeIconW = _getIconWidget(context, activeIcon) ?? _getIconWidget(context, icon, isActive: true);

    return BottomNavigationBarItem(
      icon: iconW ?? Gaps.empty,
      activeIcon: activeIconW,
      label: label,
    );
  }

  Widget? _getIconWidget(BuildContext context, dynamic icon, {bool isActive = false}) {
    if (icon == null) {
      return null;
    }
    if (icon is AssetGenImage) {
      return _getAssetImage(context, icon, isActive: isActive);
    } else if (icon is IconData) {
      return getIconData(context, icon, isActive: isActive);
    } else if (icon is IconData) {
      return getIconData(context, icon, isActive: isActive);
    } else {
      return const SizedBox();
    }
  }

  Widget getIconData(
    BuildContext context,
    IconData data, {
    bool isActive = false,
  }) =>
      Icon(
        data,
        size: iconSize * 1.3,
      );

  Image _getAssetImage(
    BuildContext context,
    AssetGenImage asset, {
    bool isActive = false,
  }) =>
      asset.image(height: iconSize, width: iconSize);

}
