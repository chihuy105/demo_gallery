import 'package:{{{pathPackage}}}/all_file/all_file.dart';
import 'package:{{{fullPath}}}/{{feature_name.snakeCase()}}_body.dart';
{{#isBloc}}import 'package:{{{fullPath}}}/bloc/{{feature_name.snakeCase()}}_bloc.dart';{{/isBloc}}{{#isCubit}}import 'package:{{{fullPath}}}/cubit/{{feature_name.snakeCase()}}_cubit.dart';{{/isCubit}}

class {{feature_name.pascalCase()}}Page extends StatelessWidget {

  const {{feature_name.pascalCase()}}Page({super.key});
{{#isBloc}}
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => {{feature_name.pascalCase()}}Bloc()..fetchItem(),
      child: Builder(
          builder: (context) {
            return BlocConsumer<{{feature_name.pascalCase()}}Bloc, {{feature_name.pascalCase()}}State>(
              listener: _onStateChanged,
              builder: (context, state) {
                return Scaffold(
                  appBar: BaseAppBar(
                      title: 'title',
                    ),
                  body: const {{feature_name.pascalCase()}}Body(),
                );
              },
            );
          }
      ),
    );
  } {{/isBloc}}{{#isCubit}}
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => {{feature_name.pascalCase()}}Cubit()..fetchItem(),
      child: Builder(
          builder: (context) {
            return BlocListener<{{feature_name.pascalCase()}}Cubit, {{feature_name.pascalCase()}}State>(
              listener: _onStateChanged,
              child: Scaffold(
                appBar: BaseAppBar(
                    title: 'title',
                  ),
                body: const _PageBodyLoading(
                  child: {{feature_name.pascalCase()}}Body(),
                ),
              ),
            );
          }
      ),
    );
  } {{/isCubit}}  {{#isNone}}
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: {{feature_name.pascalCase()}}Body(),
    );
  } {{/isNone}}

  void _onStateChanged(BuildContext context, {{feature_name.pascalCase()}}State state) {
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
    return BlocBuilder<{{feature_name.pascalCase()}}Cubit, {{feature_name.pascalCase()}}State>(
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
