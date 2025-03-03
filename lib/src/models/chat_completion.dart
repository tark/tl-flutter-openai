import 'package:json_annotation/json_annotation.dart';

part 'chat_completion.g.dart';

@JsonSerializable()
class ChatCompletion {
  ChatCompletion({
    this.id,
    this.choices,
    this.created,
    this.model,
    this.serviceTier,
    this.systemFingerprint,
    this.object,
    this.usage,
  });

  final String? id;
  final List<ChatCompletionChoice>? choices;
  final int? created;
  final String? model;
  final String? serviceTier;
  final String? systemFingerprint;
  final String? object;
  final ChatCompletionUsage? usage;

  factory ChatCompletion.fromJson(Map<String, dynamic> json) => _$ChatCompletionFromJson(json);

  Map<String, dynamic> toJson() => _$ChatCompletionToJson(this);
}

@JsonSerializable()
class ChatCompletionChoice {
  ChatCompletionChoice({
    this.finishReason,
    this.index,
    this.message,
    this.logprobs,
  });

  final String? finishReason;
  final int? index;
  final ChatCompletionMessage? message;
  final ChatCompletionLogprobs? logprobs;

  factory ChatCompletionChoice.fromJson(Map<String, dynamic> json) => _$ChatCompletionChoiceFromJson(json);

  Map<String, dynamic> toJson() => _$ChatCompletionChoiceToJson(this);
}

@JsonSerializable()
class ChatCompletionMessage {
  ChatCompletionMessage({
    this.role,
    this.content,
    this.refusal,
    this.toolCalls,
    this.audio,
    this.id,
  });

  final String? content;
  final String? refusal;
  final List<ChatCompletionToolCall>? toolCalls;
  final String? role;
  final ChatCompletionAudio? audio;
  final String? id;

  factory ChatCompletionMessage.fromJson(Map<String, dynamic> json) => _$ChatCompletionMessageFromJson(json);

  Map<String, dynamic> toJson() => _$ChatCompletionMessageToJson(this);
}

@JsonSerializable()
class ChatCompletionToolCall {
  ChatCompletionToolCall({
    this.id,
    this.type,
    this.function,
  });

  final String? id;
  final String? type;
  final ChatCompletionFunction? function;

  factory ChatCompletionToolCall.fromJson(Map<String, dynamic> json) => _$ChatCompletionToolCallFromJson(json);

  Map<String, dynamic> toJson() => _$ChatCompletionToolCallToJson(this);
}

@JsonSerializable()
class ChatCompletionUsage {
  ChatCompletionUsage({
    this.completionTokens,
    this.promptTokens,
    this.totalTokens,
    this.completionTokensDetails,
    this.promptTokensDetails,
  });

  final int? completionTokens;
  final int? promptTokens;
  final int? totalTokens;
  final ChatCompletionTokenDetails? completionTokensDetails;
  final ChatCompletionTokenDetails? promptTokensDetails;

  factory ChatCompletionUsage.fromJson(Map<String, dynamic> json) => _$ChatCompletionUsageFromJson(json);

  Map<String, dynamic> toJson() => _$ChatCompletionUsageToJson(this);
}

@JsonSerializable()
class ChatCompletionFunction {
  ChatCompletionFunction({
    this.name,
    this.arguments,
  });

  final String? name;
  final String? arguments;

  factory ChatCompletionFunction.fromJson(Map<String, dynamic> json) => _$ChatCompletionFunctionFromJson(json);

  Map<String, dynamic> toJson() => _$ChatCompletionFunctionToJson(this);
}

@JsonSerializable()
class ChatCompletionTokenDetails {
  ChatCompletionTokenDetails({
    this.acceptedPredictionTokens,
    this.audioTokens,
    this.reasoningTokens,
    this.rejectedPredictionTokens,
  });

  final int? acceptedPredictionTokens;
  final int? audioTokens;
  final int? reasoningTokens;
  final int? rejectedPredictionTokens;

  factory ChatCompletionTokenDetails.fromJson(Map<String, dynamic> json) => _$ChatCompletionTokenDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$ChatCompletionTokenDetailsToJson(this);
}

@JsonSerializable()
class ChatCompletionAudio {
  ChatCompletionAudio({
    this.id,
    this.expiresAt,
    this.data,
    this.transcript,
  });

  final String? id;
  final int? expiresAt;
  final String? data;
  final String? transcript;

  factory ChatCompletionAudio.fromJson(Map<String, dynamic> json) => _$ChatCompletionAudioFromJson(json);

  Map<String, dynamic> toJson() => _$ChatCompletionAudioToJson(this);
}

@JsonSerializable()
class ChatCompletionLogprobs {
  ChatCompletionLogprobs({
    this.content,
    this.refusal,
  });

  final List<ChatCompletionLogprobsContent>? content;
  final List<ChatCompletionLogprobsRefusal>? refusal;

  factory ChatCompletionLogprobs.fromJson(Map<String, dynamic> json) => _$ChatCompletionLogprobsFromJson(json);

  Map<String, dynamic> toJson() => _$ChatCompletionLogprobsToJson(this);
}

@JsonSerializable()
class ChatCompletionLogprobsContent {
  ChatCompletionLogprobsContent({
    this.token,
    this.logprob,
    this.bytes,
    this.topLogprobs,
  });

  final String? token;
  final int? logprob;
  final List<int>? bytes;
  final List<ChatCompletionLogprob>? topLogprobs;

  factory ChatCompletionLogprobsContent.fromJson(Map<String, dynamic> json) => _$ChatCompletionLogprobsContentFromJson(json);

  Map<String, dynamic> toJson() => _$ChatCompletionLogprobsContentToJson(this);
}

@JsonSerializable()
class ChatCompletionLogprobsRefusal {
  ChatCompletionLogprobsRefusal({
    this.token,
    this.logprob,
    this.bytes,
    this.topLogprobs,
  });

  final String? token;
  final int? logprob;
  final List<int>? bytes;
  final List<ChatCompletionLogprob>? topLogprobs;

  factory ChatCompletionLogprobsRefusal.fromJson(Map<String, dynamic> json) => _$ChatCompletionLogprobsRefusalFromJson(json);

  Map<String, dynamic> toJson() => _$ChatCompletionLogprobsRefusalToJson(this);
}

@JsonSerializable()
class ChatCompletionLogprob {
  ChatCompletionLogprob({
    this.token,
    this.logprob,
    this.bytes,
  });

  final String? token;
  final int? logprob;
  final List<int>? bytes;

  factory ChatCompletionLogprob.fromJson(Map<String, dynamic> json) => _$ChatCompletionLogprobFromJson(json);

  Map<String, dynamic> toJson() => _$ChatCompletionLogprobToJson(this);
}
