import 'package:json_annotation/json_annotation.dart';

part 'questions.g.dart';

@JsonSerializable()
class Questions {
  @JsonKey(name: 'question 1')
  String? question1;
  @JsonKey(name: 'question 2')
  String? question2;
  @JsonKey(name: 'question 3')
  String? question3;
  @JsonKey(name: 'question 4')
  String? question4;
  @JsonKey(name: 'question 5')
  String? question5;

  Questions({
    this.question1,
    this.question2,
    this.question3,
    this.question4,
    this.question5,
  });

  factory Questions.fromJson(Map<String, dynamic> json) {
    return _$QuestionsFromJson(json);
  }

  Map<String, dynamic> toJson() => _$QuestionsToJson(this);
}
