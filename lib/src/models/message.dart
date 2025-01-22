
@JsonSerializable(explicitToJson: true)
class Message {
  final String type;
  final String content;

  Message({
    required this.type,
    required this.content,
  });

  factory Message.fromJson(Map<String, dynamic> json) => _$MessageFromJson(json);
  Map<String, dynamic> toJson() => _$MessageToJson(this);
}
