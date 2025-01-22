import 'package:json_annotation/json_annotation.dart';

part 'tool_choice.g.dart';

@JsonSerializable(explicitToJson: true)
class ToolChoice {
  final String? type;
  final Map<String, dynamic>? function;

  ToolChoice({
    this.type,
    this.function,
  });

  factory ToolChoice.fromJson(Map<String, dynamic> json) => _$ToolChoiceFromJson(json);
  Map<String, dynamic> toJson() => _$ToolChoiceToJson(this);
}
