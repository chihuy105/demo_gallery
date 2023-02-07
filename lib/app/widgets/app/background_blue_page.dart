import 'package:demo_gallery/all_file/all_file.dart';
import 'package:demo_gallery/app/widgets/app_bar/app_bar_divider_top_radius.dart';

class BackgroundBluePage extends StatelessWidget {
  const BackgroundBluePage({Key? key, required this.body, required this.appBar, this.floatingActionButton}) : super(key: key);

  final Widget body;
  final Widget? floatingActionButton;
  final PreferredSizeWidget? appBar;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Container(
          decoration: const BoxDecoration(
            gradient: RadialGradient(
              center: Alignment(0.685, -0.6),
              colors: [
                Color(0xc906c3ff),
                Color(0xf70066ff),
              ],
              radius: 0.9375,
            ),
          ),
          // decoration: const BoxDecoration(
          //   gradient: RadialGradient(
          //     colors: [
          //       Color(0xc906c3ff),
          //       Color(0xf70066ff),
          //     ],
          //     center: Alignment(0.685, -0.6),
          //     radius: 0.9375,
          //   ),
          // ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: appBar,
          floatingActionButton: floatingActionButton,
          body: AppBarDividerTopRadius(
            child: body,
          ).pt6(),
        ),
      ],
    );
  }
}
