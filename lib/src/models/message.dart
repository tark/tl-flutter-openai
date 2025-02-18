import 'package:json_annotation/json_annotation.dart';

part 'message.g.dart';

@JsonSerializable(createFactory: false, createToJson: false)
abstract class Message {
  /// The role of the messages author, in this case `user`.
  final String role;
  final String content;

  Message({
    required this.role,
    required this.content,
  });

  factory Message.fromJson(Map<String, dynamic> json) {
    switch (json['role']) {
      case 'user':
        return UserMessage.fromJson(json);
      case 'assistant':
        return AssistantMessage.fromJson(json);
      case 'system':
        return SystemMessage.fromJson(json);
      case 'developer':
        return DeveloperMessage.fromJson(json);
      default:
        throw ArgumentError('Unknown animal type: ${json['type']}');
    }
  }

  Map<String, dynamic> toJson();
}

@JsonSerializable()
class DeveloperMessage extends Message {

  final String? name;

  DeveloperMessage({
    required super.content,
    this.name,
  }) : super(
    role: 'developer',
  );

  factory DeveloperMessage.fromJson(Map<String, dynamic> json) =>
      _$DeveloperMessageFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$DeveloperMessageToJson(this);
}

@JsonSerializable()
class SystemMessage extends Message {
  final String? name;

  SystemMessage({
    required super.content,
    this.name,
  }) : super(
    role: 'system',
  );

  factory SystemMessage.fromJson(Map<String, dynamic> json) =>
      _$SystemMessageFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$SystemMessageToJson(this);
}

/// Messages sent by an end user, containing prompts or additional
/// context information.
@JsonSerializable()
class UserMessage extends Message {
  /// The contents of the user message.

  /// An optional name for the participant. Provides the model information
  /// to differentiate between participants of the same role.
  final String? name;

  UserMessage({
    required super.content,
    this.name,
  }) : super(
    role: 'user',
  );

  factory UserMessage.fromJson(Map<String, dynamic> json) =>
      _$UserMessageFromJson(json);

  @override
  Map<String, dynamic> toJson() => {
    ..._$UserMessageToJson(this),
    'role': role,
  };
}

@JsonSerializable()
class AssistantMessage extends Message {
  final String? refusal;
  final String? name;
  final AssistantMessageAudio? audio;
  final List<ToolCall>? toolCalls;

  AssistantMessage({
    super.content = '',
    this.refusal,
    this.name,
    this.audio,
    this.toolCalls,
  }) : super(
    role: 'assistant',
  );

  factory AssistantMessage.fromJson(Map<String, dynamic> json) =>
      _$AssistantMessageFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$AssistantMessageToJson(this);
}

@JsonSerializable()
class AssistantMessageAudio {
  final String id;

  AssistantMessageAudio({
    required this.id,
  });

  factory AssistantMessageAudio.fromJson(Map<String, dynamic> json) =>
      _$AssistantMessageAudioFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$AssistantMessageAudioToJson(this);
}

@JsonSerializable()
class ToolCall {
  final String id;
  final String type;
  final ToolCallFunction function;

  ToolCall({
    required this.id,
    required this.type,
    required this.function,
  });

  factory ToolCall.fromJson(Map<String, dynamic> json) =>
      _$ToolCallFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ToolCallToJson(this);
}

@JsonSerializable()
class ToolCallFunction {
  final String name;
  final String arguments;

  ToolCallFunction({
    required this.name,
    required this.arguments,
  });

  factory ToolCallFunction.fromJson(Map<String, dynamic> json) =>
      _$ToolCallFunctionFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ToolCallFunctionToJson(this);
}