import 'package:json_annotation/json_annotation.dart';

part 'result.g.dart';

@JsonSerializable()
class Result {
  @JsonKey(name: 'tiredness')
  String? tiredness;
  @JsonKey(name: 'predictmood')
  String? predictmood;
  @JsonKey(name: 'celebrity')
  String? celebrity;
  @JsonKey(name: 'tip')
  String? tip;

  Result({this.tiredness, this.predictmood, this.celebrity, this.tip});

  factory Result.fromJson(Map<String, dynamic> json) {
    return _$ResultFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ResultToJson(this);
}
