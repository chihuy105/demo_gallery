import 'package:{{{pathPackage}}}/all_file/all_file.dart';
{{#isBloc}}import 'package:{{{fullPath}}}/bloc/{{feature_name.snakeCase()}}_bloc.dart';{{/isBloc}}{{#isCubit}}import 'package:{{{fullPath}}}/cubit/{{feature_name.snakeCase()}}_cubit.dart';{{/isCubit}}

class {{feature_name.pascalCase()}}Body {{#isBloc}}extends StatelessWidget{{/isBloc}}{{#isCubit}}extends StatelessWidget{{/isCubit}}{{#isProvider}}extends StatelessWidget{{/isProvider}}{{#isNone}}extends StatelessWidget{{/isNone}} {

  const {{feature_name.pascalCase()}}Body({super.key}) ;
{{#isBloc}}
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<{{feature_name.pascalCase()}}Bloc, {{feature_name.pascalCase()}}State>(
      builder: (context, state) {
        return SingleChildScrollViewSliver(
          child: Column(
            children: [

            ],
          ),
        );
      },
    );
  }{{/isBloc}}{{#isCubit}}
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollViewSliver(
      child: BlocBuilder<{{feature_name.pascalCase()}}Cubit, {{feature_name.pascalCase()}}State>(
        builder: (context, state) {
          final item = state.item;
          return Column(
            children: [

            ],
          );
        },
      ),
    );
  }{{/isCubit}}{{#isNone}}
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollViewSliver(
          child: Column(
            children: [

            ],
          ),
        );
  }{{/isNone}}
}
