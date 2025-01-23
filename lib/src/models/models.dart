abstract class Message {}

enum MessageRoles { developer, system, user, assistant, tool }

class ChatCompletionRequest {
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

  ChatCompletionRequest({
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
}

class DeveloperMessage extends Message {
  final String content;
  final String role;
  final String? name;

  DeveloperMessage({
    required this.content,
    required this.role,
    this.name,
  });

}

class SystemMessage extends Message {
  final String content;
  final String role;
  final String? name;

  SystemMessage({
    required this.content,
    required this.role,
    this.name,
  });
}

class AssistantMessage extends Message {
  final String content;
  final String role;
  final String? name;

  AssistantMessage({
    required this.content,
    required this.role,
    this.name,
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

class StreamOptions {
  final Map<String, dynamic>? options;

  StreamOptions({
    this.options,
  });
}

