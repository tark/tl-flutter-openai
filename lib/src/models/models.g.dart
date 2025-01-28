// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Message _$MessageFromJson(Map<String, dynamic> json) => Message();

Map<String, dynamic> _$MessageToJson(Message instance) => <String, dynamic>{};

ChatCompletionRequest _$ChatCompletionRequestFromJson(
        Map<String, dynamic> json) =>
    ChatCompletionRequest(
      messages: (json['messages'] as List<dynamic>)
          .map((e) => Message.fromJson(e as Map<String, dynamic>))
          .toList(),
      model: json['model'] as String,
      store: json['store'] as bool?,
    );

Map<String, dynamic> _$ChatCompletionRequestToJson(
        ChatCompletionRequest instance) =>
    <String, dynamic>{
      'messages': instance.messages,
      'model': instance.model,
      'store': instance.store,
    };

DeveloperMessage _$DeveloperMessageFromJson(Map<String, dynamic> json) =>
    DeveloperMessage(
      content: json['content'] as String,
      role: json['role'] as String,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$DeveloperMessageToJson(DeveloperMessage instance) =>
    <String, dynamic>{
      'content': instance.content,
      'role': instance.role,
      'name': instance.name,
    };

SystemMessage _$SystemMessageFromJson(Map<String, dynamic> json) =>
    SystemMessage(
      content: json['content'] as String,
      role: json['role'] as String,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$SystemMessageToJson(SystemMessage instance) =>
    <String, dynamic>{
      'content': instance.content,
      'role': instance.role,
      'name': instance.name,
    };

UserMessage _$UserMessageFromJson(Map<String, dynamic> json) => UserMessage(
      content: json['content'] as String,
      role: json['role'] as String,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$UserMessageToJson(UserMessage instance) =>
    <String, dynamic>{
      'content': instance.content,
      'role': instance.role,
      'name': instance.name,
    };

AssistantMessage _$AssistantMessageFromJson(Map<String, dynamic> json) =>
    AssistantMessage(
      role: json['role'] as String,
      content: json['content'] as String?,
      refusal: json['refusal'] as String?,
      name: json['name'] as String?,
      audio: json['audio'] == null
          ? null
          : AssistantMessageAudio.fromJson(
              json['audio'] as Map<String, dynamic>),
      toolCalls: (json['toolCalls'] as List<dynamic>?)
          ?.map((e) => ToolCall.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AssistantMessageToJson(AssistantMessage instance) =>
    <String, dynamic>{
      'role': instance.role,
      'content': instance.content,
      'refusal': instance.refusal,
      'name': instance.name,
      'audio': instance.audio,
      'toolCalls': instance.toolCalls,
    };

AssistantMessageAudio _$AssistantMessageAudioFromJson(
        Map<String, dynamic> json) =>
    AssistantMessageAudio(
      id: json['id'] as String,
    );

Map<String, dynamic> _$AssistantMessageAudioToJson(
        AssistantMessageAudio instance) =>
    <String, dynamic>{
      'id': instance.id,
    };

ToolCall _$ToolCallFromJson(Map<String, dynamic> json) => ToolCall(
      id: json['id'] as String,
      type: json['type'] as String,
      function:
          ToolCallFunction.fromJson(json['function'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ToolCallToJson(ToolCall instance) => <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'function': instance.function,
    };

ToolCallFunction _$ToolCallFunctionFromJson(Map<String, dynamic> json) =>
    ToolCallFunction(
      name: json['name'] as String,
      arguments: json['arguments'] as String,
    );

Map<String, dynamic> _$ToolCallFunctionToJson(ToolCallFunction instance) =>
    <String, dynamic>{
      'name': instance.name,
      'arguments': instance.arguments,
    };

StreamOptions _$StreamOptionsFromJson(Map<String, dynamic> json) =>
    StreamOptions(
      options: json['options'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$StreamOptionsToJson(StreamOptions instance) =>
    <String, dynamic>{
      'options': instance.options,
    };
