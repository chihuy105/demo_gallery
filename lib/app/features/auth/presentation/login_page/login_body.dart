import 'package:demo_gallery/all_file/all_file.dart';
import 'package:demo_gallery/app/features/auth/presentation/login_page/cubit/login_cubit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginBody extends StatelessWidget {

  const LoginBody({super.key}) ;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Btn(
          leading: const FaIcon(FontAwesomeIcons.google),
          child: 'Login with Google'.text.make(),
          onPressed: () {
            context.read<LoginCubit>().loginGG();
          },
        ).centered(),
      ],
    );
  }
}
