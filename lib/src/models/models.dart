import 'dart:js/js_wasm.dart';

import 'package:json_annotation/json_annotation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../tl_flutter_openai.dart';

part 'models.g.dart';

enum MessageRoles { developer, system, user, assistant, tool }

enum AIModel {
  @JsonValue('o1-mini')
  o1Mini('o1-mini'),
  @JsonValue('o1-preview')
  o1Preview('o1-preview'),
  @JsonValue('gpt-4o')
  gpt4o('gpt-4o'),
  @JsonValue('gpt-4o-mini')
  gpt4oMini('gpt-4o-mini'),
  @JsonValue('gpt-4o-audio-preview')
  gpt4oAudioPreview('gpt-4o-audio-preview'),
  @JsonValue('gpt-4o-mini-audio-preview')
  gpt4oMiniAudioPreview('gpt-4o-mini-audio-preview'),
  @JsonValue('gpt-4turbo-preview')
  gpt4turboPreview('gpt-4-turbo-preview'),
  @JsonValue('gpt-4-turbo')
  gpt4turbo('gpt-4-turbo'),
  @JsonValue('gpt-4')
  gpt4('gpt-4'),
  @JsonValue('chatgpt-4o-latest')
  chatgpt4oLatest('chatgpt-4o-latest'),
  @JsonValue('gpt-3.5-turbo')
  gpt35Turbo('gpt-3.5-turbo');

  final String value;

  const AIModel(this.value);

  @override
  String toString() => value;
}

@JsonSerializable(explicitToJson: true)
class ChatCompletionRequest {
  ChatCompletionRequest({
    required this.messages,
    required this.model,
    this.store = false,
    this.reasoningEffort,
    this.metadata,
    this.frequencyPenalty,
    this.logitBias,
    this.logprobs,
    this.topLogprobs,
    this.maxCompletionTokens,
    this.n,
    this.modalities,
    this.prediction,
  });

  final List<Message>? messages;
  final AIModel? model;
  final bool? store;
  @JsonKey(name: 'reasoning_effort')
  final String? reasoningEffort;
  final Map<String, dynamic>? metadata;
  @JsonKey(name: 'frequency_penalty')
  final int? frequencyPenalty;
  @JsonKey(name: 'logit_bias')
  final Map<String, dynamic>? logitBias;
  final bool? logprobs;
  @JsonKey(name: 'top_logprobs')
  final int? topLogprobs;
  @JsonKey(name: 'max_completion_tokens')
  final int? maxCompletionTokens;
  final int? n;
  final List<String>? modalities;
  final List<String>? prediction;

  factory ChatCompletionRequest.fromJson(Map<String, dynamic> json) =>
      _$ChatCompletionRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ChatCompletionRequestToJson(this);
}

class StaticContent {
  final String type;
  final String content;

  StaticContent({
    required this.type,
    required this.content,
  });
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
