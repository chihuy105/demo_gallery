import 'package:demo_gallery/all_file/all_file.dart';
import 'package:demo_gallery/app/features/gallery/presentation/gallery_page/cubit/gallery_cubit.dart';
import 'package:demo_gallery/app/features/gallery/presentation/gallery_page/gallery_body.dart';
import 'package:demo_gallery/app/widgets/app/app_config_switch/language_switch.dart';
import 'package:demo_gallery/app/widgets/app/app_config_switch/theme_mode_switch.dart';
import 'package:demo_gallery/l10n/l10n.dart';

class GalleryPage extends StatelessWidget {
  const GalleryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GalleryCubit(),
      child: Builder(
        builder: (context) {
          return Scaffold(
            appBar: BaseAppBar(
              title: context.l10n.galleryPage,
              args: const BaseAppBarArgs(
                titleSpacing: 20,
                actions: [
                  ThemeSwitch(),
                  LanguageSwitch(),
                ],
              ),
            ),
            body: const GalleryBody(),
          );
        },
      ),
    );
  }
}
