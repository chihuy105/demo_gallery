// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'common_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FCMTokenReq _$FCMTokenReqFromJson(Map<String, dynamic> json) => FCMTokenReq(
      deviceID: json['deviceID'] as String?,
      deviceToken: json['deviceToken'] as String?,
      type: json['type'] as String?,
    );

Map<String, dynamic> _$FCMTokenReqToJson(FCMTokenReq instance) =>
    <String, dynamic>{
      'deviceID': instance.deviceID,
      'deviceToken': instance.deviceToken,
      'type': instance.type,
    };

RangeValueModel<T> _$RangeValueModelFromJson<T>(Map<String, dynamic> json) =>
    RangeValueModel<T>(
      start: _$JsonConverterFromJson<Object, T>(
          json['start'], _Converter<T?>().fromJson),
      end: _$JsonConverterFromJson<Object, T>(
          json['end'], _Converter<T?>().fromJson),
    );

Map<String, dynamic> _$RangeValueModelToJson<T>(RangeValueModel<T> instance) =>
    <String, dynamic>{
      'start': _$JsonConverterToJson<Object, T>(
          instance.start, _Converter<T?>().toJson),
      'end': _$JsonConverterToJson<Object, T>(
          instance.end, _Converter<T?>().toJson),
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);
