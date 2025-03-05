import 'package:json_annotation/json_annotation.dart';

part 'message.g.dart';

@JsonSerializable(createFactory: false, createToJson: false)
abstract class Message {
  final String role;

  Message({
    required this.role,
  });

  factory Message.fromJson(Map<String, dynamic> json) {
    switch (json['role']) {
      case 'user':
        return UserMessage.fromJson(json);
      case 'assistant':
        return AssistantMessage.fromJson(json);
      case 'system':
        return SystemMessage.fromJson(json);
      default:
        throw ArgumentError('Unknown animal type: ${json['type']}');
    }
  }

  Map<String, dynamic> toJson();
}

@JsonSerializable(explicitToJson: true)
class SystemMessage extends Message {
  final String content;
  final String? name;

  SystemMessage({
    required this.content,
    this.name,
  }) : super(
          role: 'system',
        );

  factory SystemMessage.fromJson(Map<String, dynamic> json) =>
      _$SystemMessageFromJson(json);

  @override
  Map<String, dynamic> toJson() => {
    ..._$SystemMessageToJson(this),
    'role': role,
  };
}

/// Messages sent by an end user, containing prompts or additional
/// context information.
@JsonSerializable(explicitToJson: true)
class UserMessage extends Message {
  /// The contents of the user message.

  /// An optional name for the participant. Provides the model information
  /// to differentiate between participants of the same role.
  final String? content;
  final List<ContentPart>? contentParts;
  final String? name;

  UserMessage({
    this.content,
    this.contentParts,
    this.name,
  }) : super(role: 'user');

  factory UserMessage.fromJson(Map<String, dynamic> json) =>
      _$UserMessageFromJson(json);

  @override
  Map<String, dynamic> toJson() => {
        ..._$UserMessageToJson(this),
        'role': role,
      };
}

@JsonSerializable(explicitToJson: true)
class AssistantMessage extends Message {
  final String? refusal;
  final String? name;
  final AssistantMessageAudio? audio;
  final List<ToolCall>? toolCalls;

  AssistantMessage({
    // required this.content,
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

@JsonSerializable(explicitToJson: true)
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

@JsonSerializable(explicitToJson: true)
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

@JsonSerializable(explicitToJson: true)
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

@JsonSerializable(createFactory: false, createToJson: false)
abstract class ContentPart {
  ContentPart({required this.type});

  final String type;

  factory ContentPart.fromJson(Map<String, dynamic> json) {
    switch (json['type']) {
      case 'text':
        return TextContentPart.fromJson(json);
      case 'image_url':
        return ImageContentPart.fromJson(json);
      case 'input_audio':
        return AudioContentPart.fromJson(json);
      default:
        throw ArgumentError('Unknown type: ${json['type']}');
    }
  }

  Map<String, dynamic> toJson();
}

@JsonSerializable(explicitToJson: true)
class TextContentPart extends ContentPart {
  TextContentPart({
    required this.text,
  }) : super(
          type: 'text',
        );

  final String text;

  factory TextContentPart.fromJson(Map<String, dynamic> json) =>
      _$TextContentPartFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$TextContentPartToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ImageContentPart extends ContentPart {
  ImageContentPart({
    required this.imageUrl,
  }) : super(
          type: 'image_url',
        );

  final ImageUrl imageUrl;

  factory ImageContentPart.fromJson(Map<String, dynamic> json) =>
      _$ImageContentPartFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ImageContentPartToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ImageUrl {
  ImageUrl({
    required this.url,
    required this.detail,
  });

  final String url;
  final String detail;

  factory ImageUrl.fromJson(Map<String, dynamic> json) =>
      _$ImageUrlFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ImageUrlToJson(this);
}

@JsonSerializable(explicitToJson: true)
class AudioContentPart extends ContentPart {
  AudioContentPart({
    required this.imageUrl,
  }) : super(
          type: 'input_audio',
        );

  final ImageUrl imageUrl;

  factory AudioContentPart.fromJson(Map<String, dynamic> json) =>
      _$AudioContentPartFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$AudioContentPartToJson(this);
}
