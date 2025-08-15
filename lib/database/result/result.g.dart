// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Result _$ResultFromJson(Map<String, dynamic> json) => Result(
  tiredness: json['tiredness'] as String?,
  predictmood: json['predictmood'] as String?,
  celebrity: json['celebrity'] as String?,
  tip: json['tip'] as String?,
);

Map<String, dynamic> _$ResultToJson(Result instance) => <String, dynamic>{
  'tiredness': instance.tiredness,
  'predictmood': instance.predictmood,
  'celebrity': instance.celebrity,
  'tip': instance.tip,
};
