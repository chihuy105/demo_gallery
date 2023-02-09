import 'package:demo_gallery/all_file/all_file.dart';
import 'package:demo_gallery/app/widgets/app/app_config_switch/bloc/app_config_cubit.dart';
import 'package:demo_gallery/l10n/l10n.dart';

class ThemeSwitch extends StatelessWidget {
  const ThemeSwitch({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppConfigCubit, AppConfigState>(
      builder: (context, state) {
        return Btn(
          btnType: BtnType.TEXT,
          padding: Dimens.edge_XS3,
          child: Icon(
            state.isDark ? Icons.dark_mode : Icons.sunny,
            color: context.theme.onPrimary(),
          ),
          onPressed: () {
            context.read<AppConfigCubit>().switchTheme();
          },
        );
      },
    );
  }
}
