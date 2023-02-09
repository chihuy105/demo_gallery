import 'package:bloc/bloc.dart';
import 'package:demo_gallery/all_file/all_file.dart';
import 'package:meta/meta.dart';

part 'app_config_state.dart';

class AppConfigCubit extends Cubit<AppConfigState> {
  AppConfigCubit() : super(const AppConfigState(locale: 'en'));

  void switchLocale() {
    if (state.locale == 'en') {
      emit(state.copyWith(locale: 'vi'));
    } else {
      emit(state.copyWith(locale: 'en'));
    }
  }

  void switchTheme() {
    emit(state.copyWith(isDark: !state.isDark));
  }
}
