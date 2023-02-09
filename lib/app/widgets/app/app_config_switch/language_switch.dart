import 'package:demo_gallery/all_file/all_file.dart';
import 'package:demo_gallery/app/widgets/app/app_config_switch/bloc/app_config_cubit.dart';
import 'package:demo_gallery/l10n/l10n.dart';


class LanguageSwitch extends StatelessWidget {
  const LanguageSwitch({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppConfigCubit, AppConfigState>(
      builder: (context, state) {
        return Btn(
          btnType: BtnType.TEXT,
          child: state.locale.toUpperCase().text.bold.colorOnPrimary(context).make(),
          onPressed: () {
            context.read<AppConfigCubit>().switchLocale();
          },
        );
      },
    );
  }
}