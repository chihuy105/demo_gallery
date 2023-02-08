import 'package:demo_gallery/all_file/all_file.dart';
import 'package:demo_gallery/app/features/gallery/presentation/gallery_page/cubit/gallery_cubit.dart';
import 'package:demo_gallery/app/features/gallery/presentation/gallery_page/gallery_body.dart';

class GalleryPage extends StatelessWidget {
  const GalleryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GalleryCubit(),
      child: Builder(
        builder: (context) {
          return const Scaffold(
            appBar: BaseAppBar(
              title: 'Gallery Page',
              args: BaseAppBarArgs(
                titleSpacing: 20,
              ),
            ),
            body: GalleryBody(),
          );
        },
      ),
    );
  }
}
