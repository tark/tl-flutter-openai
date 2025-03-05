// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatCompletionRequest _$ChatCompletionRequestFromJson(
        Map<String, dynamic> json) =>
    ChatCompletionRequest(
      messages: (json['messages'] as List<dynamic>?)
          ?.map((e) => Message.fromJson(e as Map<String, dynamic>))
          .toList(),
      model: $enumDecodeNullable(_$AIModelEnumMap, json['model']),
      store: json['store'] as bool? ?? false,
      reasoningEffort: json['reasoning_effort'] as String?,
      metadata: json['metadata'] as Map<String, dynamic>?,
      frequencyPenalty: (json['frequency_penalty'] as num?)?.toInt(),
      logitBias: json['logit_bias'] as Map<String, dynamic>?,
      logprobs: json['logprobs'] as bool?,
      topLogprobs: (json['top_logprobs'] as num?)?.toInt(),
      n: (json['n'] as num?)?.toInt(),
      modalities: (json['modalities'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      prediction: (json['prediction'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$ChatCompletionRequestToJson(
        ChatCompletionRequest instance) =>
    <String, dynamic>{
      'messages': instance.messages?.map((e) => e.toJson()).toList(),
      'model': _$AIModelEnumMap[instance.model],
      'store': instance.store,
      'reasoning_effort': instance.reasoningEffort,
      'metadata': instance.metadata,
      'frequency_penalty': instance.frequencyPenalty,
      'logit_bias': instance.logitBias,
      'logprobs': instance.logprobs,
      'top_logprobs': instance.topLogprobs,
      'n': instance.n,
      'modalities': instance.modalities,
      'prediction': instance.prediction,
    };

const _$AIModelEnumMap = {
  AIModel.o1Mini: 'o1-mini',
  AIModel.o1Preview: 'o1-preview',
  AIModel.gpt4o: 'gpt-4o',
  AIModel.gpt4oMini: 'gpt-4o-mini',
  AIModel.gpt4oAudioPreview: 'gpt-4o-audio-preview',
  AIModel.gpt4oMiniAudioPreview: 'gpt-4o-mini-audio-preview',
  AIModel.gpt4turboPreview: 'gpt-4turbo-preview',
  AIModel.gpt4turbo: 'gpt-4-turbo',
  AIModel.gpt4: 'gpt-4',
  AIModel.chatgpt4oLatest: 'chatgpt-4o-latest',
  AIModel.gpt35Turbo: 'gpt-3.5-turbo',
};

StreamOptions _$StreamOptionsFromJson(Map<String, dynamic> json) =>
    StreamOptions(
      options: json['options'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$StreamOptionsToJson(StreamOptions instance) =>
    <String, dynamic>{
      'options': instance.options,
    };
