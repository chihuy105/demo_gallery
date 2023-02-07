import 'dart:ui' as ui;

import 'package:demo_gallery/all_file/all_file.dart';

class ClipVoucherTopEffect extends StatelessWidget {
  const ClipVoucherTopEffect({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        SizedBox(
          height: 50,
          child: ClipPath(
            clipper: _MultipleRoundedPointsClipper(
              numberOfPoints: 32,
            ),
            child: child.rotate(180),
          ),
        ).rotate(180),
      ],
    );
  }
}

class ClipVoucherLeftEffect extends StatelessWidget {
  const ClipVoucherLeftEffect({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return RotatedBox(
      quarterTurns: 1,
      child: Stack(
        fit: StackFit.expand,
        children: [
          SizedBox(
            height: 50,
            child: ClipPath(
              clipper: _MultipleRoundedPointsClipper(
                numberOfPoints: 42,
              ),
              child: RotatedBox(
                quarterTurns: -1,
                child: child,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _MultipleRoundedPointsClipper extends CustomClipper<ui.Path> {
  _MultipleRoundedPointsClipper({this.numberOfPoints = 16});

  final int numberOfPoints;

  @override
  ui.Path getClip(Size size) {
    ui.Path path = ui.Path();
    path.lineTo(0.0, size.height);
    double x = 0;
    double y = size.height;
    double increment = size.width / numberOfPoints + 4;

    int i = 0;
    while (x < size.width) {
      if (i.isOdd) {
        final x2 = x + increment / 1;
        path.arcToPoint(Offset(x2, y), radius: Radius.circular(1));
      } else {
        final x2 = x + increment / 2;
        path.lineTo(x2, y);
      }
      x += increment;
      i++;
    }
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper old) => old != this;
}
