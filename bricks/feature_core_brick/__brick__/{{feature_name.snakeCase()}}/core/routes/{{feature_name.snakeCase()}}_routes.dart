import 'package:{{{pathPackage}}}/all_file/all_file.dart';
import '../../presentation/{{feature_name.snakeCase()}}_main/{{feature_name.snakeCase()}}_page.dart';

const {{feature_name.snakeCase()}}Routes = [
    AutoRoute(
      path: '{{feature_name.pascalCase()}}',
      page: {{feature_name.pascalCase()}}Page,
    )
];