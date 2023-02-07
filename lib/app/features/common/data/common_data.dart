import 'package:demo_gallery/all_file/all_file.dart';

part 'common_data.g.dart';

enum ItemDetailStatus { initial, loading, success, error }

@JsonSerializable(ignoreUnannotated: false)
class FCMTokenReq {
  final String? deviceID;
  final String? deviceToken;
  final String? type;

  const FCMTokenReq({
    this.deviceID,
    this.deviceToken,
    this.type,
  });

  factory FCMTokenReq.fromJson(Map<String, dynamic> json) =>
      _$FCMTokenReqFromJson(json);

  Map<String, dynamic> toJson() => _$FCMTokenReqToJson(this);
}


@JsonSerializable(ignoreUnannotated: false)
class RangeValueModel<T> {
  @_Converter()
  final T? start;
  @_Converter()
  final T? end;

  factory RangeValueModel.fromJson(Map<String, dynamic> json) =>
      _$RangeValueModelFromJson<T>(json);

  Map<String, dynamic> toJson() => _$RangeValueModelToJson(this);

//<editor-fold desc="Data Methods">

  const RangeValueModel({
    this.start,
    this.end,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RangeValueModel &&
          runtimeType == other.runtimeType &&
          start == other.start &&
          end == other.end);

  @override
  int get hashCode => start.hashCode ^ end.hashCode;

  @override
  String toString() {
    return 'RangeValueModel{' + ' start: $start,' + ' end: $end,' + '}';
  }

  RangeValueModel copyWith({
    T? start,
    T? end,
  }) {
    return RangeValueModel(
      start: start ?? this.start,
      end: end ?? this.end,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'start': this.start,
      'end': this.end,
    };
  }

  factory RangeValueModel.fromMap(Map<String, dynamic> map) {
    return RangeValueModel(
      start: map['start'] as T,
      end: map['end'] as T,
    );
  }

//</editor-fold>
}

class _Converter<T> implements JsonConverter<T, Object> {
  const _Converter();

  @override
  T fromJson(Object json) {
    return json as T;
  }

  @override
  Object toJson(T object) {
    // This will only work if `object` is a native JSON type:
    //   num, String, bool, null, etc
    // Or if it has a `toJson()` function`.
    return object as Object;
  }
}
