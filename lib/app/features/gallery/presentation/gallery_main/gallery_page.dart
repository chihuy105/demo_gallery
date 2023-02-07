import 'package:demo_gallery/all_file/all_file.dart';
import 'package:demo_gallery/app/features/gallery/presentation/gallery_main/cubit/gallery_cubit.dart';
import 'package:demo_gallery/app/features/gallery/presentation/gallery_main/gallery_body.dart';

class GalleryPage extends StatelessWidget {
  const GalleryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GalleryCubit(),
      child: Builder(builder: (context) {
        return BlocListener<GalleryCubit, GalleryState>(
          listener: _onStateChanged,
          child: const Scaffold(
            appBar: BaseAppBar(
              title: 'Gallery Page',
              args: BaseAppBarArgs(
                titleSpacing: 20,
              ),
            ),
            body: GalleryBody(),
          ),
        );
      }),
    );
  }

  void _onStateChanged(BuildContext context, GalleryState state) {
    if (state.status == ItemDetailStatus.error) {
      DialogUtils.showAlertDialog(context, content: state.errorMsg);
    }
  }
}
