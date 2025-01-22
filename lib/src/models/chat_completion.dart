import 'package:json_annotation/json_annotation.dart';

part 'request_model.g.dart';

@JsonSerializable(explicitToJson: true)
class RequestModel {
  final List<Message> messages;
  final String model;
  final bool? store;
  final String? reasoningEffort;
  final Map<String, dynamic>? metadata;
  final double? frequencyPenalty;
  final Map<int, int>? logitBias;
  final bool? logprobs;
  final int? topLogprobs;
  final int? maxCompletionTokens;
  final int? n;
  final List<String>? modalities;
  final Prediction? prediction;
  final double? presencePenalty;
  final ResponseFormat? responseFormat;
  final int? seed;
  final String? serviceTier;
  final dynamic stop;
  final bool? stream;
  final StreamOptions? streamOptions;
  final double? temperature;
  final double? topP;
  final List<String>? tools;
  final ToolChoice? toolChoice;
  final bool? parallelToolCalls;
  final String? user;

  RequestModel({
    required this.messages,
    required this.model,
    this.store,
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
    this.presencePenalty,
    this.responseFormat,
    this.seed,
    this.serviceTier,
    this.stop,
    this.stream,
    this.streamOptions,
    this.temperature,
    this.topP,
    this.tools,
    this.toolChoice,
    this.parallelToolCalls,
    this.user,
  });

  factory RequestModel.fromJson(Map<String, dynamic> json) => _$RequestModelFromJson(json);
  Map<String, dynamic> toJson() => _$RequestModelToJson(this);
}

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

@JsonSerializable(explicitToJson: true)
class Prediction {
  final String? type;
  final Map<String, dynamic>? jsonSchema;

  Prediction({
    this.type,
    this.jsonSchema,
  });

  factory Prediction.fromJson(Map<String, dynamic> json) => _$PredictionFromJson(json);
  Map<String, dynamic> toJson() => _$PredictionToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ResponseFormat {
  final String? type;
  final Map<String, dynamic>? jsonSchema;

  ResponseFormat({
    this.type,
    this.jsonSchema,
  });

  factory ResponseFormat.fromJson(Map<String, dynamic> json) => _$ResponseFormatFromJson(json);
  Map<String, dynamic> toJson() => _$ResponseFormatToJson(this);
}

@JsonSerializable(explicitToJson: true)
class StreamOptions {
  final Map<String, dynamic>? options;

  StreamOptions({
    this.options,
  });

  factory StreamOptions.fromJson(Map<String, dynamic> json) => _$StreamOptionsFromJson(json);
  Map<String, dynamic> toJson() => _$StreamOptionsToJson(this);
}

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
