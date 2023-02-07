import 'package:demo_gallery/all_file/all_file.dart';

class SingleChildScrollViewSliver extends StatelessWidget {
  const SingleChildScrollViewSliver({
    super.key,
    required this.child,
    this.hasScrollBody,
    this.withPadding,
  });

  const SingleChildScrollViewSliver.withPadding({
    super.key,
    required this.child,
    this.hasScrollBody,
    this.withPadding = true,
  });

  final Widget child;
  final bool? hasScrollBody;
  final bool? withPadding;

  @override
  Widget build(BuildContext context) {
    // if (hasScrollBody == true) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            children: [
              if (withPadding ?? false) Gaps.vGap16,
              child,
              if (withPadding ?? false) Gaps.bottomSpacing(context),
            ],
          ),
        ),
      ],
    );

    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: hasScrollBody ?? false,
          child: Column(
            children: [
              child,
            ],
          ),
        ),
      ],
    );
  }
}
