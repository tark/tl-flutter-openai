// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeveloperMessage _$DeveloperMessageFromJson(Map<String, dynamic> json) =>
    DeveloperMessage(
      content: json['content'] as String,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$DeveloperMessageToJson(DeveloperMessage instance) =>
    <String, dynamic>{
      'content': instance.content,
      'name': instance.name,
    };

SystemMessage _$SystemMessageFromJson(Map<String, dynamic> json) =>
    SystemMessage(
      content: json['content'] as String,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$SystemMessageToJson(SystemMessage instance) =>
    <String, dynamic>{
      'content': instance.content,
      'name': instance.name,
    };

UserMessage _$UserMessageFromJson(Map<String, dynamic> json) => UserMessage(
      content: json['content'] as String,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$UserMessageToJson(UserMessage instance) =>
    <String, dynamic>{
      'content': instance.content,
      'name': instance.name,
    };

AssistantMessage _$AssistantMessageFromJson(Map<String, dynamic> json) =>
    AssistantMessage(
      content: json['content'] as String? ?? '',
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
