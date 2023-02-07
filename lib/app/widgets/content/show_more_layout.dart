import 'package:demo_gallery/all_file/all_file.dart';
import 'package:demo_gallery/app/widgets/button/actions/btn_more_text.dart';
import 'package:get/get.dart';

class ShowMoreLayout extends StatefulWidget {
  const ShowMoreLayout({
    super.key,
    required this.moreLayout,
    required this.lessLayout,
    this.defaultValue = false,
    this.moreBtnBuilder,
  });

  final Widget moreLayout;
  final Widget lessLayout;
  final Widget Function(bool isMore, VoidCallback onPressed)? moreBtnBuilder;
  final bool defaultValue;

  @override
  ShowMoreLayoutState createState() => ShowMoreLayoutState();
}

class ShowMoreLayoutState extends State<ShowMoreLayout> {
  final _showMoreLD = false.obs;

  @override
  void initState() {
    super.initState();
    _showMoreLD.value = widget.defaultValue;
  }

  @override
  void dispose() {
    _showMoreLD.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return _showMoreLD.value
          ? _Layout(
              isMore: true,
              moreBtnBuilder: widget.moreBtnBuilder,
              onPressed: _toggle,
              child: widget.moreLayout,
            )
          : _Layout(
              isMore: false,
              moreBtnBuilder: widget.moreBtnBuilder,
              onPressed: _toggle,
              child: widget.lessLayout,
            );
    });
  }

  void _toggle() {
    _showMoreLD.value = !_showMoreLD.value;
  }
}

class _Layout extends StatelessWidget {
  const _Layout({
    super.key,
    required this.child,
    required this.onPressed,
    required this.isMore,
    this.moreBtnBuilder,
  });

  final bool isMore;
  final Widget child;
  final VoidCallback onPressed;
  final Widget Function(bool isMore, VoidCallback onPressed)? moreBtnBuilder;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        child,
        if (moreBtnBuilder != null)
          moreBtnBuilder!(isMore, onPressed)
        else
          BtnMoreText(
            isMore: isMore,
            onPressed: onPressed,
          ).objectCenterRight().pt12()
      ],
    );
  }
}
