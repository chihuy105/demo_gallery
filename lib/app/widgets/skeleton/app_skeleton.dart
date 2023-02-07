import 'package:demo_gallery/all_file/all_file.dart';
import 'package:shimmer/shimmer.dart';

class AppSkeleton extends StatelessWidget {
  const AppSkeleton({super.key, this.width, this.height, this.shape, this.borderRadius});

  final double? width;
  final double? height;
  final BorderRadiusGeometry? borderRadius;

  final BoxShape? shape;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      enabled: true,
      baseColor: Colors.grey[100]!,
      highlightColor: Colors.grey[50]!,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          shape: shape ?? BoxShape.rectangle,
          color: Colors.white,
          borderRadius: borderRadius,
        ),
      ),
    );
  }
}
