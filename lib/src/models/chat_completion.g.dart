// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_completion.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatCompletion _$ChatCompletionFromJson(Map<String, dynamic> json) =>
    ChatCompletion(
      id: json['id'] as String?,
      choices: (json['choices'] as List<dynamic>?)
          ?.map((e) => ChatCompletionChoice.fromJson(e as Map<String, dynamic>))
          .toList(),
      created: (json['created'] as num?)?.toInt(),
      model: json['model'] as String?,
      serviceTier: json['serviceTier'] as String?,
      systemFingerprint: json['systemFingerprint'] as String?,
      object: json['object'] as String?,
      usage: json['usage'] == null
          ? null
          : ChatCompletionUsage.fromJson(json['usage'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ChatCompletionToJson(ChatCompletion instance) =>
    <String, dynamic>{
      'id': instance.id,
      'choices': instance.choices,
      'created': instance.created,
      'model': instance.model,
      'serviceTier': instance.serviceTier,
      'systemFingerprint': instance.systemFingerprint,
      'object': instance.object,
      'usage': instance.usage,
    };

ChatCompletionChoice _$ChatCompletionChoiceFromJson(
        Map<String, dynamic> json) =>
    ChatCompletionChoice(
      finishReason: json['finishReason'] as String?,
      index: (json['index'] as num?)?.toInt(),
      message: json['message'] == null
          ? null
          : ChatCompletionMessage.fromJson(
              json['message'] as Map<String, dynamic>),
      logprobs: json['logprobs'] == null
          ? null
          : ChatCompletionLogprobs.fromJson(
              json['logprobs'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ChatCompletionChoiceToJson(
        ChatCompletionChoice instance) =>
    <String, dynamic>{
      'finishReason': instance.finishReason,
      'index': instance.index,
      'message': instance.message,
      'logprobs': instance.logprobs,
    };

ChatCompletionMessage _$ChatCompletionMessageFromJson(
        Map<String, dynamic> json) =>
    ChatCompletionMessage(
      role: json['role'] as String?,
      content: json['content'] as String?,
      refusal: json['refusal'] as String?,
      toolCalls: (json['toolCalls'] as List<dynamic>?)
          ?.map(
              (e) => ChatCompletionToolCall.fromJson(e as Map<String, dynamic>))
          .toList(),
      audio: json['audio'] == null
          ? null
          : ChatCompletionAudio.fromJson(json['audio'] as Map<String, dynamic>),
      id: json['id'] as String?,
    );

Map<String, dynamic> _$ChatCompletionMessageToJson(
        ChatCompletionMessage instance) =>
    <String, dynamic>{
      'content': instance.content,
      'refusal': instance.refusal,
      'toolCalls': instance.toolCalls,
      'role': instance.role,
      'audio': instance.audio,
      'id': instance.id,
    };

ChatCompletionToolCall _$ChatCompletionToolCallFromJson(
        Map<String, dynamic> json) =>
    ChatCompletionToolCall(
      id: json['id'] as String?,
      type: json['type'] as String?,
      function: json['function'] == null
          ? null
          : ChatCompletionFunction.fromJson(
              json['function'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ChatCompletionToolCallToJson(
        ChatCompletionToolCall instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'function': instance.function,
    };

ChatCompletionUsage _$ChatCompletionUsageFromJson(Map<String, dynamic> json) =>
    ChatCompletionUsage(
      completionTokens: (json['completionTokens'] as num?)?.toInt(),
      promptTokens: (json['promptTokens'] as num?)?.toInt(),
      totalTokens: (json['totalTokens'] as num?)?.toInt(),
      completionTokensDetails: json['completionTokensDetails'] == null
          ? null
          : ChatCompletionTokenDetails.fromJson(
              json['completionTokensDetails'] as Map<String, dynamic>),
      promptTokensDetails: json['promptTokensDetails'] == null
          ? null
          : ChatCompletionTokenDetails.fromJson(
              json['promptTokensDetails'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ChatCompletionUsageToJson(
        ChatCompletionUsage instance) =>
    <String, dynamic>{
      'completionTokens': instance.completionTokens,
      'promptTokens': instance.promptTokens,
      'totalTokens': instance.totalTokens,
      'completionTokensDetails': instance.completionTokensDetails,
      'promptTokensDetails': instance.promptTokensDetails,
    };

ChatCompletionFunction _$ChatCompletionFunctionFromJson(
        Map<String, dynamic> json) =>
    ChatCompletionFunction(
      name: json['name'] as String?,
      arguments: json['arguments'] as String?,
    );

Map<String, dynamic> _$ChatCompletionFunctionToJson(
        ChatCompletionFunction instance) =>
    <String, dynamic>{
      'name': instance.name,
      'arguments': instance.arguments,
    };

ChatCompletionTokenDetails _$ChatCompletionTokenDetailsFromJson(
        Map<String, dynamic> json) =>
    ChatCompletionTokenDetails(
      acceptedPredictionTokens:
          (json['acceptedPredictionTokens'] as num?)?.toInt(),
      audioTokens: (json['audioTokens'] as num?)?.toInt(),
      reasoningTokens: (json['reasoningTokens'] as num?)?.toInt(),
      rejectedPredictionTokens:
          (json['rejectedPredictionTokens'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ChatCompletionTokenDetailsToJson(
        ChatCompletionTokenDetails instance) =>
    <String, dynamic>{
      'acceptedPredictionTokens': instance.acceptedPredictionTokens,
      'audioTokens': instance.audioTokens,
      'reasoningTokens': instance.reasoningTokens,
      'rejectedPredictionTokens': instance.rejectedPredictionTokens,
    };

ChatCompletionAudio _$ChatCompletionAudioFromJson(Map<String, dynamic> json) =>
    ChatCompletionAudio(
      id: json['id'] as String?,
      expiresAt: (json['expiresAt'] as num?)?.toInt(),
      data: json['data'] as String?,
      transcript: json['transcript'] as String?,
    );

Map<String, dynamic> _$ChatCompletionAudioToJson(
        ChatCompletionAudio instance) =>
    <String, dynamic>{
      'id': instance.id,
      'expiresAt': instance.expiresAt,
      'data': instance.data,
      'transcript': instance.transcript,
    };

ChatCompletionLogprobs _$ChatCompletionLogprobsFromJson(
        Map<String, dynamic> json) =>
    ChatCompletionLogprobs(
      content: (json['content'] as List<dynamic>?)
          ?.map((e) =>
              ChatCompletionLogprobsContent.fromJson(e as Map<String, dynamic>))
          .toList(),
      refusal: (json['refusal'] as List<dynamic>?)
          ?.map((e) =>
              ChatCompletionLogprobsRefusal.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ChatCompletionLogprobsToJson(
        ChatCompletionLogprobs instance) =>
    <String, dynamic>{
      'content': instance.content,
      'refusal': instance.refusal,
    };

ChatCompletionLogprobsContent _$ChatCompletionLogprobsContentFromJson(
        Map<String, dynamic> json) =>
    ChatCompletionLogprobsContent(
      token: json['token'] as String?,
      logprob: (json['logprob'] as num?)?.toInt(),
      bytes: (json['bytes'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList(),
      topLogprobs: (json['topLogprobs'] as List<dynamic>?)
          ?.map(
              (e) => ChatCompletionLogprob.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ChatCompletionLogprobsContentToJson(
        ChatCompletionLogprobsContent instance) =>
    <String, dynamic>{
      'token': instance.token,
      'logprob': instance.logprob,
      'bytes': instance.bytes,
      'topLogprobs': instance.topLogprobs,
    };

ChatCompletionLogprobsRefusal _$ChatCompletionLogprobsRefusalFromJson(
        Map<String, dynamic> json) =>
    ChatCompletionLogprobsRefusal(
      token: json['token'] as String?,
      logprob: (json['logprob'] as num?)?.toInt(),
      bytes: (json['bytes'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList(),
      topLogprobs: (json['topLogprobs'] as List<dynamic>?)
          ?.map(
              (e) => ChatCompletionLogprob.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ChatCompletionLogprobsRefusalToJson(
        ChatCompletionLogprobsRefusal instance) =>
    <String, dynamic>{
      'token': instance.token,
      'logprob': instance.logprob,
      'bytes': instance.bytes,
      'topLogprobs': instance.topLogprobs,
    };

ChatCompletionLogprob _$ChatCompletionLogprobFromJson(
        Map<String, dynamic> json) =>
    ChatCompletionLogprob(
      token: json['token'] as String?,
      logprob: (json['logprob'] as num?)?.toInt(),
      bytes: (json['bytes'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList(),
    );

Map<String, dynamic> _$ChatCompletionLogprobToJson(
        ChatCompletionLogprob instance) =>
    <String, dynamic>{
      'token': instance.token,
      'logprob': instance.logprob,
      'bytes': instance.bytes,
    };
