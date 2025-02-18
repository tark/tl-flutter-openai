// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_completion_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatCompletionResponse _$ChatCompletionResponseFromJson(
        Map<String, dynamic> json) =>
    ChatCompletionResponse(
      id: json['id'] as String?,
      object: json['object'] as String?,
      created: (json['created'] as num?)?.toInt(),
      model: json['model'] as String?,
      serviceTier: json['serviceTier'] as String?,
      systemFingerprint: json['systemFingerprint'] as String?,
      choices: (json['choices'] as List<dynamic>?)
          ?.map((e) => Choice.fromJson(e as Map<String, dynamic>))
          .toList(),
      usage: json['usage'] == null
          ? null
          : Usage.fromJson(json['usage'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ChatCompletionResponseToJson(
        ChatCompletionResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'object': instance.object,
      'created': instance.created,
      'model': instance.model,
      'serviceTier': instance.serviceTier,
      'systemFingerprint': instance.systemFingerprint,
      'choices': instance.choices,
      'usage': instance.usage,
    };

Choice _$ChoiceFromJson(Map<String, dynamic> json) => Choice(
      index: (json['index'] as num?)?.toInt(),
      finishReason: json['finishReason'] as String?,
      message: json['message'] == null
          ? null
          : Message.fromJson(json['message'] as Map<String, dynamic>),
      logprobs: json['logprobs'] == null
          ? null
          : Logprobs.fromJson(json['logprobs'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ChoiceToJson(Choice instance) => <String, dynamic>{
      'index': instance.index,
      'finishReason': instance.finishReason,
      'message': instance.message,
      'logprobs': instance.logprobs,
    };

Logprobs _$LogprobsFromJson(Map<String, dynamic> json) => Logprobs();

Map<String, dynamic> _$LogprobsToJson(Logprobs instance) => <String, dynamic>{};

Usage _$UsageFromJson(Map<String, dynamic> json) => Usage(
      completionTokens: (json['completionTokens'] as num?)?.toInt(),
      promptTokens: (json['promptTokens'] as num?)?.toInt(),
      totalTokens: (json['totalTokens'] as num?)?.toInt(),
      completionTokensDetails: json['completionTokensDetails'] == null
          ? null
          : TokenDetails.fromJson(
              json['completionTokensDetails'] as Map<String, dynamic>),
      promptTokensDetails: json['promptTokensDetails'] == null
          ? null
          : TokenDetails.fromJson(
              json['promptTokensDetails'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UsageToJson(Usage instance) => <String, dynamic>{
      'completionTokens': instance.completionTokens,
      'promptTokens': instance.promptTokens,
      'totalTokens': instance.totalTokens,
      'completionTokensDetails': instance.completionTokensDetails,
      'promptTokensDetails': instance.promptTokensDetails,
    };

TokenDetails _$TokenDetailsFromJson(Map<String, dynamic> json) => TokenDetails(
      acceptedPredictionTokens:
          (json['acceptedPredictionTokens'] as num?)?.toInt(),
      audioTokens: (json['audioTokens'] as num?)?.toInt(),
      reasoningTokens: (json['reasoningTokens'] as num?)?.toInt(),
      rejectedPredictionTokens:
          (json['rejectedPredictionTokens'] as num?)?.toInt(),
      cachedTokens: (json['cachedTokens'] as num?)?.toInt(),
    );

Map<String, dynamic> _$TokenDetailsToJson(TokenDetails instance) =>
    <String, dynamic>{
      'acceptedPredictionTokens': instance.acceptedPredictionTokens,
      'audioTokens': instance.audioTokens,
      'reasoningTokens': instance.reasoningTokens,
      'rejectedPredictionTokens': instance.rejectedPredictionTokens,
      'cachedTokens': instance.cachedTokens,
    };
