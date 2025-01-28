import 'package:json_annotation/json_annotation.dart';

part 'models.g.dart';

@JsonSerializable()
class Message {

  Message();

  factory Message.fromJson(Map<String, dynamic> json) => _$MessageFromJson(json);

  Map<String, dynamic> toJson() => _$MessageToJson(this);

}

enum MessageRoles { developer, system, user, assistant, tool }

@JsonSerializable()
class ChatCompletionRequest {
  final List<Message> messages;
  final String model;
  final bool? store;
  // final String? reasoningEffort;
  // final Map<String, dynamic>? metadata;
  // final double? frequencyPenalty;
  // final Map<int, int>? logitBias;
  // final bool? logprobs;
  // final int? topLogprobs;
  // final int? maxCompletionTokens;
  // final int? n;
  // final List<String>? modalities;
  // final Prediction? prediction;
  // final double? presencePenalty;
  // final ResponseFormat? responseFormat;
  // final int? seed;
  // final String? serviceTier;
  // final dynamic stop;
  // final bool? stream;
  // final StreamOptions? streamOptions;
  // final double? temperature;
  // final double? topP;
  // final List<String>? tools;
  // final ToolChoice? toolChoice;
  // final bool? parallelToolCalls;
  // final String? user;

  ChatCompletionRequest({
    required this.messages,
    required this.model,
    this.store,
    // this.reasoningEffort,
    // this.metadata,
    // this.frequencyPenalty,
    // this.logitBias,
    // this.logprobs,
    // this.topLogprobs,
    // this.maxCompletionTokens,
    // this.n,
    // this.modalities,
    // this.prediction,
    // this.presencePenalty,
    // this.responseFormat,
    // this.seed,
    // this.serviceTier,
    // this.stop,
    // this.stream,
    // this.streamOptions,
    // this.temperature,
    // this.topP,
    // this.tools,
    // this.toolChoice,
    // this.parallelToolCalls,
    // this.user,
  });

  factory ChatCompletionRequest.fromJson(Map<String, dynamic> json) => _$ChatCompletionRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ChatCompletionRequestToJson(this);
}

@JsonSerializable()
class DeveloperMessage extends Message {
  final String content;
  final String role;
  final String? name;

  DeveloperMessage({
    required this.content,
    required this.role,
    this.name,
  });

  factory DeveloperMessage.fromJson(Map<String, dynamic> json) => _$DeveloperMessageFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$DeveloperMessageToJson(this);

}

@JsonSerializable()
class SystemMessage extends Message {
  final String content;
  final String role;
  final String? name;

  SystemMessage({
    required this.content,
    required this.role,
    this.name,
  });

  factory SystemMessage.fromJson(Map<String, dynamic> json) => _$SystemMessageFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$SystemMessageToJson(this);
}

@JsonSerializable()
class UserMessage extends Message {
  final String content;
  final String role;
  final String? name;

  UserMessage({
    required this.content,
    required this.role,
    this.name,
  });

  factory UserMessage.fromJson(Map<String, dynamic> json) => _$UserMessageFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$UserMessageToJson(this);
}

@JsonSerializable()
class AssistantMessage extends Message {
  final String role;
  final String? content;
  final String? refusal;
  final String? name;
  final AssistantMessageAudio? audio;
  final List<ToolCall>? toolCalls;

  AssistantMessage({
    required this.role,
    this.content,
    this.refusal,
    this.name,
    this.audio,
    this.toolCalls,
  });

  factory AssistantMessage.fromJson(Map<String, dynamic> json) => _$AssistantMessageFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$AssistantMessageToJson(this);
}

@JsonSerializable()
class AssistantMessageAudio extends Message {
  final String id;

  AssistantMessageAudio({
    required this.id,

  });

  factory AssistantMessageAudio.fromJson(Map<String, dynamic> json) => _$AssistantMessageAudioFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$AssistantMessageAudioToJson(this);
}

@JsonSerializable()
class ToolCall extends Message {
  final String id;
  final String type;
  final ToolCallFunction function;

  ToolCall({
    required this.id,
    required this.type,
    required this.function,
  });

  factory ToolCall.fromJson(Map<String, dynamic> json) => _$ToolCallFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ToolCallToJson(this);
}

@JsonSerializable()
class ToolCallFunction extends Message {
  final String name;
  final String arguments;

  ToolCallFunction({
    required this.name,
    required this.arguments,
  });

  factory ToolCallFunction.fromJson(Map<String, dynamic> json) => _$ToolCallFunctionFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ToolCallFunctionToJson(this);
}

class ResponseFormat {
  final String? type;
  final Map<String, dynamic>? jsonSchema;

  ResponseFormat({
    this.type,
    this.jsonSchema,
  });
}

class Prediction {
  final String? type;
  final Map<String, dynamic>? jsonSchema;

  Prediction({
    this.type,
    this.jsonSchema,
  });
}

class ToolChoice {
  final String? type;
  final Map<String, dynamic>? function;

  ToolChoice({
    this.type,
    this.function,
  });
}

@JsonSerializable()
class StreamOptions {
  final Map<String, dynamic>? options;

  StreamOptions({
    this.options,
  });
}

