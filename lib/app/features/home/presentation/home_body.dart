import 'package:demo_gallery/all_file/all_file.dart';
import 'package:demo_gallery/app/features/home/presentation/cubit/home_cubit.dart';

class HomeBody extends StatelessWidget {

  const HomeBody({super.key}) ;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollViewSliver(
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          final item = state.item;
          return Column(
            children: [

            ],
          );
        },
      ),
    );
  }
}
