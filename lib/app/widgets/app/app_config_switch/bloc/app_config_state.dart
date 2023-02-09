part of 'app_config_cubit.dart';


class AppConfigState extends Equatable {
  const AppConfigState({
    required this.locale,
    this.isDark = false,
  });

  final String locale;
  final bool isDark;

  @override
  List<Object?> get props => [locale, isDark];

  AppConfigState copyWith({
    String? locale,
    bool? isDark,
  }) {
    return AppConfigState(
      locale: locale ?? this.locale,
      isDark: isDark ?? this.isDark,
    );
  }
}