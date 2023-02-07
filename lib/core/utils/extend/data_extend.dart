// ignore_for_file: unnecessary_this

import 'package:demo_gallery/all_file/all_file.dart';
import 'package:easy_mask/easy_mask.dart';
import 'package:intl/intl.dart';

T? castOrNull<T>(dynamic x) => x is T ? x : null;

T castOrFallback<T>(dynamic x, T fallback) => x is T ? x : fallback;

extension IterableExt<T> on Iterable<T> {
  Iterable<T> superJoin(T separator) {
    final iterator = this.iterator;
    if (!iterator.moveNext()) return [];

    final _l = [iterator.current];
    while (iterator.moveNext()) {
      _l
        ..add(separator)
        ..add(iterator.current);
    }
    return _l;
  }
}

extension DataExtendNum on num? {
  bool get toBoolean => this == null ? false : this == 1;

  bool isNullOrEmpty() {
    return this == null;
  }

  bool isNotNullOrEmpty() {
    return this != null;
  }

  String toCountStr() {
    return this.isNullOrEmpty() ? '0' : (this! > 99 ? '99+' : this.toString());
  }

  String? intValidator() => this == null ? 'inputErrorMsg' : null;

  String? toStringHideZero() => this != null ? (this == 0 ? null : this.toString()) : null;

  String toStringWithZero() => this != null ? (this.toString()) : '0';

  String toStringWithZeroNegativeZero() => this != null ? (this! >= 0 ? (this.toString()) : '0') : '0';

  String? get toTwoDigit => isNotNullOrEmpty() ? this?.toString().padLeft(2, '0') : null;

  num get toNumWithZero => this ?? 0;

  String? get yearToFullDateBegin => this == null ? null : '$this-01-01T00:00:00.000Z';

  String? get yearToFullYearEnd => this == null ? null : '$this-12-31T23:59:59.000Z';
}

extension DataExtendBool on bool? {
  num get toNumBoolean => this == true ? 1 : 0;

  num? get toNumBooleanWithNull => this == null ? null : (this ?? false ? 1 : 0);
}

extension DataDynamicExtendBool on Object? {
  bool get boolean => this == null ? false : (this == 1 || this == true);

  num? toNumValue() {
    if (this == null) return null;
    if (this is num) return this as num;
    if (this is String) return num.tryParse(this.toString());

    return null;
  }
}

extension DynamicExtend on dynamic {
  bool? toBoolean() {
    if (this is num) {
      return this == null ? false : this == 1;
    }
    if (this is bool) {
      return (this as bool);
    }
    return null;
  }
}

extension DataExtendString on String {
  String? toPeriodStr() {
    final period = this;

    return (period.length) < 6 ? period : '${period.substring(0, 2)}/${period.substring(2, 6)}';
  }

  String toPeriodFullStr() {
    return '${'walletPeriod'} ${(toPeriodStr())}';
  }
}

extension DataExtendObjectNullAble on Object? {
  num get toNumWithZero => (this is num) ? (this as num) : num.tryParse(this.toString()) ?? 0;

  bool isNotNullOrEmpty() => (this is String) ? (this as String).isNotNullOrEmpty() : this != null;
}

extension DataExtendStringNullAble on String? {
  bool searchEqual(String? searchText) {
    return this?.unsignedLower()?.trim().contains(searchText?.unsignedLower()?.trim() ?? '') ?? false;
  }

  num? get toNum => num.tryParse(this ?? '');

  num get toNumWithZero => num.tryParse(this ?? '') ?? 0;

  String toStringWithZero() => this != null ? (this.toString()) : '0';

  String? get withColonMark => this == null ? null : '$this:';

  String? get withRequiredMark => this == null ? null : '$this *';

  String? get withMustRequiredMsg => this == null ? null : '$this ${'invalidFill'}';

  String? withAreaUnit() {
    if (this.isNullOrEmpty()) return null;

    return '${this} ${AppConstant.AREA_UNIT}';
  }

  List<String>? getStrFromEnum<E extends Enum>(List<E> values) {
    return this.isNullOrEmpty() ? null : this?.split(',').mapAsList((strIndex) => int.tryParse(strIndex)).filter((item) => item != null).mapAsList((index) => values.getOrNull(index ?? -1)?.name ?? '');
  }

  List<String>? getStrFromEnumTr<E extends Enum>(List<E> values) {
    return this.isNullOrEmpty() ? null : this?.split(',').mapAsList((strIndex) => int.tryParse(strIndex)).filter((item) => item != null).mapAsList((index) => values.getOrNull(index ?? -1)?.name ?? '');
  }

  T isEmptyOrValue<T>(T value) {
    if (this == null || this!.isEmpty) {
      return value;
    }
    return this as T;
  }

  bool get isEmptyOrNull => this == null || this!.isEmpty;

  String? capitalizeOnly() {
    if (this.isNullOrEmpty()) return null;
    return this?.split(RegExp(r"\n")).map((e) => e.capitalizeFirstOnly()).join('\n').split(' ').map((e) => e.capitalizeFirstOnly()).join(' ');
  }

  String? capitalizeFirstOnly() {
    if (this.isNullOrEmpty()) return null;
    return this![0].toUpperCase() + this!.substring(1);
  }

  String? unsigned() {
    if (this.isNullOrEmpty()) return this;

    var result = this;
    for (var i = 0; i < _vietnamese.length; ++i) {
      result = result?.replaceAll(_vietnameseRegex[i], _vietnamese[i]);
    }
    return result;
  }

  String? unsignedLower() {
    return this.unsigned()?.toLowerCase();
  }

  bool isNullOrEmpty() => this == null || this?.trim() == '';

  bool isNotNullOrEmpty() => !isNullOrEmpty();

  String? stringValidator() => this.isNullOrEmpty() ? 'inputErrorMsg' : null;

  String get toPhoneFormattedStr => this.isNullOrEmpty() ? '' : (MaskTemplate.phoneMask.getMaskedString(this ?? ''));

  String getDate() {
    return this?.substring(0, 10).split('-').reversed.join('/') ?? '';
  }

  String getDatetime() {
    String date = this?.substring(0, 10) ?? '';
    String time = this?.substring(11, 19) ?? '';
    var dateTime = DateFormat("yyyy-MM-dd HH:mm:ss").parse(date + ' ' + time, true);
    var dateLocal = dateTime.toLocal();
    return dateLocal.toString().substring(0, 16);
  }
}

extension RangeExtension on int {
  List<int> toNum(int maxInclusive, {int step = 1}) => [for (int i = this; i <= maxInclusive; i += step) i];
}

extension DateTimeExtension on DateTime {
  DateTime clearTime() {
    return DateTime(this.year, this.month, this.day);
  }

  DateTime setTime({int? newHour, int? newMinute}) {
    var time = toLocal();
    return DateTime(time.year, time.month, time.day, newHour ?? time.hour, newMinute ?? time.minute, time.second, time.millisecond, time.microsecond);
  }
}

const _vietnamese = 'aAeEoOuUiIdDyY';
final _vietnameseRegex = <RegExp>[
  RegExp(r'à|á|ạ|ả|ã|â|ầ|ấ|ậ|ẩ|ẫ|ă|ằ|ắ|ặ|ẳ|ẵ'),
  RegExp(r'À|Á|Ạ|Ả|Ã|Â|Ầ|Ấ|Ậ|Ẩ|Ẫ|Ă|Ằ|Ắ|Ặ|Ẳ|Ẵ'),
  RegExp(r'è|é|ẹ|ẻ|ẽ|ê|ề|ế|ệ|ể|ễ'),
  RegExp(r'È|É|Ẹ|Ẻ|Ẽ|Ê|Ề|Ế|Ệ|Ể|Ễ'),
  RegExp(r'ò|ó|ọ|ỏ|õ|ô|ồ|ố|ộ|ổ|ỗ|ơ|ờ|ớ|ợ|ở|ỡ'),
  RegExp(r'Ò|Ó|Ọ|Ỏ|Õ|Ô|Ồ|Ố|Ộ|Ổ|Ỗ|Ơ|Ờ|Ớ|Ợ|Ở|Ỡ'),
  RegExp(r'ù|ú|ụ|ủ|ũ|ư|ừ|ứ|ự|ử|ữ'),
  RegExp(r'Ù|Ú|Ụ|Ủ|Ũ|Ư|Ừ|Ứ|Ự|Ử|Ữ'),
  RegExp(r'ì|í|ị|ỉ|ĩ'),
  RegExp(r'Ì|Í|Ị|Ỉ|Ĩ'),
  RegExp(r'đ'),
  RegExp(r'Đ'),
  RegExp(r'ỳ|ý|ỵ|ỷ|ỹ'),
  RegExp(r'Ỳ|Ý|Ỵ|Ỷ|Ỹ')
];

class MaskTemplate {
  static final MagicMask phoneMask = MagicMask.buildMask('9999 999 9999');
}
