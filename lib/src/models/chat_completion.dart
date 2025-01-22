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
