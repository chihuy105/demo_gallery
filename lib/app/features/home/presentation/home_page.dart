import 'package:demo_gallery/all_file/all_file.dart';
import 'package:demo_gallery/app/features/home/presentation/cubit/home_cubit.dart';
import 'package:demo_gallery/app/features/home/presentation/home_body.dart';
import 'package:demo_gallery/core/utils/dialog_utils.dart';

class HomePage extends StatelessWidget {

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..fetchItem(),
      child: Builder(
          builder: (context) {
            return BlocListener<HomeCubit, HomeState>(
              listener: _onStateChanged,
              child: Scaffold(
                appBar: BaseAppBar(
                    title: 'title',
                  ),
                body: const _PageBodyLoading(
                  child: HomeBody(),
                ),
              ),
            );
          }
      ),
    );
  }   

  void _onStateChanged(BuildContext context, HomeState state) {
    if (state.status == ItemDetailStatus.error) {
      DialogUtils.showAlertDialog(context, content: state.errorMsg);
    }
  }
}

class _PageBodyLoading extends StatelessWidget {
  const _PageBodyLoading({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        // if (state.status == ItemDetailStatus.error) {
        //   return SimpleErrorText(errorMsg: state.errorMsg ?? '');
        // }

        return AppTopLayout.loadingOnTop(
          loadingType: AppTopLayoutLoadingType.iosLoading,
          isLoading: state.status == ItemDetailStatus.loading || state.status == ItemDetailStatus.initial,
          child: child,
        );
      },
    );
  }
}
