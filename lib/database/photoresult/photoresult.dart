import 'package:json_annotation/json_annotation.dart';

part 'photoresult.g.dart';

@JsonSerializable()
class Photoresult {
  @JsonKey(name: 'tiredness')
  String? tiredness;
  @JsonKey(name: 'predictmood')
  String? predictmood;
  @JsonKey(name: 'celebrity')
  String? celebrity;
  @JsonKey(name: 'tip')
  String? tip;

  Photoresult({this.tiredness, this.predictmood, this.celebrity, this.tip});

  factory Photoresult.fromJson(Map<String, dynamic> json) {
    return _$PhotoresultFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PhotoresultToJson(this);
}
